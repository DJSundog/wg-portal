# AUTOGENERATED FILE - DO NOT EDIT
# -WGP- Interface: {{ .Interface.DeviceName }} / Updated: {{ .Interface.UpdatedAt }} / Created: {{ .Interface.CreatedAt }}
# -WGP- Interface display name: {{ .Interface.DisplayName }}
# -WGP- Interface mode: {{ .Interface.Type }}
# -WGP- PublicKey = {{ .Interface.PublicKey }}

[Interface]

# Core settings
PrivateKey = {{ .Interface.PrivateKey }}
Address = {{ .Interface.IPsStr }}

# Misc. settings (optional)
{{- if ne .Interface.ListenPort 0}}
ListenPort = {{ .Interface.ListenPort }}
{{- end}}
{{- if ne .Interface.Mtu 0}}
MTU = {{.Interface.Mtu}}
{{- end}}
{{- if and (ne .Interface.DNSStr "") (eq $.Interface.Type "client")}}
DNS = {{ .Interface.DNSStr }}
{{- end}}
{{- if ne .Interface.FirewallMark 0}}
FwMark = {{.Interface.FirewallMark}}
{{- end}}
{{- if ne .Interface.RoutingTable ""}}
Table = {{.Interface.RoutingTable}}
{{- end}}
{{- if .Interface.SaveConfig}}
SaveConfig = true
{{- end}}

# Interface hooks (optional)
{{- if .Interface.PreUp}}
PreUp = {{ .Interface.PreUp }}
{{- end}}
{{- if .Interface.PostUp}}
PostUp = {{ .Interface.PostUp }}
{{- end}}
{{- if .Interface.PreDown}}
PreDown = {{ .Interface.PreDown }}
{{- end}}
{{- if .Interface.PostDown}}
PostDown = {{ .Interface.PostDown }}
{{- end}}

#
# Peers
#

{{range .Peers}}
{{- if not .DeactivatedAt}}
# -WGP- Peer: {{.Identifier}} / Updated: {{.UpdatedAt}} / Created: {{.CreatedAt}}
# -WGP- Peer email: {{.Email}}
{{- if .PrivateKey}}
# -WGP- PrivateKey: {{.PrivateKey}}
{{- end}}
[Peer]
PublicKey = {{ .PublicKey }}
{{- if .PresharedKey}}
PresharedKey = {{ .PresharedKey }}
{{- end}}
{{- if eq $.Interface.Type "server"}}
AllowedIPs = {{ .IPsStr }}
{{- end}}
{{- if eq $.Interface.Type "client"}}
{{- if .AllowedIPsStr}}
AllowedIPs = {{ .AllowedIPsStr }}
{{- end}}
{{- end}}
{{- if and (ne .Endpoint "") (eq $.Interface.Type "client")}}
Endpoint = {{ .Endpoint }}
{{- end}}
{{- if ne .PersistentKeepalive 0}}
PersistentKeepalive = {{ .PersistentKeepalive }}
{{- end}}
{{- end}}
{{end}}