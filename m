Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD053B531C
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Mar 2026 15:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772809952; cv=none; b=CDJS4npezRNWSM2BQ32VF6j7tBHVmogg2XXW0SGhDS1jmuK6u+0PBotPxhG3m3/KLcU6UYj60nNCvcec2o3fIW1dpb7Y4udb0LhOO6Ris1X1oezJy2Ufn6o018IMQN0PJX9LE7QXlkw1cPQ4H4niNG3ucgoQI9eznyuaRyEzaPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772809952; c=relaxed/simple;
	bh=17XHRS4px9KoFXD3y4Fn4cvpcpjxzAIN0p18op7B0go=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=F60HcBsBWbzM4/DSQcBIzylWVEH7UpnxN+rzu0fv08wCq3esn0pH4xyEfzduciI/93lx00Ft247Z7iZ8mNXLGFb+vqgN32ZXsjJtQdlKpI06GH8SFmfjxebt/Yy64oKyiE8ZNwTznRXIn6KJZOIbcA8iWaEIlf2Gy69gZlkCkzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YAiCcAnM; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YAiCcAnM"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b9360e9f43bso1093954566b.3
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Mar 2026 07:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772809946; x=1773414746; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WoYJHkcy80PnGGgEzZEeH4O5cD02mG4V0mk4JEgh3Zc=;
        b=YAiCcAnMOY9R4MARduJnxwYtMrADa/gOQqTATmqmBbGelRwYuNBV6z5WBUYa+nXMXH
         5EJiKeV3CxV90SOBj8LKYKMPXutjNZrlPKGiTXDAMe8NELnZJR2Zkm9ZCUKJKkRNsasz
         k0h7PgAN7UW7xJ+Gjzr6u8COOp8I+kRGSJOnpwMskMuEH6WKpLyzUdEgIsx4/C11b9ji
         qN05vy8JUaYe7HDszeGHudMZuDfvB3FH78sfQEiMrvJVOPYnOq4y28mRl/FsX3VONTmL
         I33BOdG0Dt/2eaPSABiO7J36EeseE/G0pP0qwyoPiAiQwnAWSErgKLBndJ30A9Z5kCkj
         kcjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772809946; x=1773414746;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WoYJHkcy80PnGGgEzZEeH4O5cD02mG4V0mk4JEgh3Zc=;
        b=l99GMCetMN6OOwdHD18TVTw+qj28w50CmBdfZNjVZ5aPlZiHwIFdlBtztbuYuTvK7X
         uh1LgcjFcU8qRnMeV3MvrAa66tbHYRrWMjRq6u59juKg3z/gwNKeKFgy8wzZ88qyzce3
         tViqihAsNdqSsx6r0FSD7hmYk+c8UMKVLdLqlAsa4Jg6sNcNzP7gvp15qLH9VmBBxId7
         c1hFLRtj5w/MbcLPNHV9PfsLPPMXsuXoOKoldHQ4MtGuliF5ylIkgz6mpjIsGICPrcpY
         r0aBEqPyA0lkCuC9Z1zPV6qZxCdIznVWyiCSY2bTuzYlymGwPWkKNekJtfZgfLEqiLVF
         ZQlA==
X-Forwarded-Encrypted: i=1; AJvYcCUatqeXd/X2xFIQUaXwtdJ4mCvLCEF6/gSBv0XHV3/FEhab4cXfEwJXyN2NJHfPcmgRe+nfREgkVyrmURsM4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQcSCK/JxPdqxar6MhlmZmzH03cScO1Ax2fLWjU2EJ368c6/a1
	PLEUPrgtjC1TQxbS6m9OeW0MlOe0q7T9zbIAJ8hZ6MPnbwagXoNU3B1kTiKx+s24ihEvRm3P0qN
	OMSasG6Bnyw+3AenVQw==
X-Received: from ejcff15.prod.google.com ([2002:a17:906:9c0f:b0:b90:4eb7:2c53])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:86aa:b0:b8e:56d1:be76 with SMTP id a640c23a62f3a-b942da72e4amr128107866b.1.1772809945692;
 Fri, 06 Mar 2026 07:12:25 -0800 (PST)
Date: Fri, 06 Mar 2026 15:12:14 +0000
In-Reply-To: <20260306-binder-netlink-v1-0-daceb5bc83f2@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260306-binder-netlink-v1-0-daceb5bc83f2@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=7323; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=17XHRS4px9KoFXD3y4Fn4cvpcpjxzAIN0p18op7B0go=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpqu7U4/HmIeXfFrF24dpNk37B9KD5/AdNewhzY
 rgs7XErlUeJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaaru1AAKCRAEWL7uWMY5
 RtlMD/9R1e230V1ReJ8yX+ZBPPtPtzgsrmUwxEH9FrvFrr92aymlgQ7HP1M9yA4eeNOQ8Jg6f2c
 P2A6Flzq6n3IdFbvoRn/P1UoLiDKrG0IJWjs33YpMdU+bU1iSH2PuHKh0tvQZFZNnBubkYbJEXf
 BzLzPuZosMJLOZ/ee5QP/gScbs0AQb1NqG7pKcysYGNOX6mGhCXZyQ5CUyTdTfzD2tWR3tBwn2s
 QsyH42Ec0zuarjIPOsrrnWf03UgVqmeQDHGtrd8p5R7lqid2NDYTvnb/7p9jWl2HedqoQ5wIGFK
 aJ82Lx99N7yVFacs6Q53LcRy/M+gmjNkSYRSHhysoisR/qiOyBTvHCqhfXQAR3xQQFqxgeAPG6l
 THGKP4/XIHuKK7tBIIoRwaVP1K6KiBJGh8Qe4n8NggU4swL/P5BwHbQIFzJVoGdnirHIC54hmX7
 uZuTSAbM63dWMJeLB9/iYSCoiPG3BbpfNs/VC1P4OYFUC1Rntd6PTbNRcEGBj2rGkvV5uRg2L3j
 prTVeLoSX8gz6x/hrgGFu3RvzVj+bKr2SvC7i+fwUZF2mDZXcJObTzO2b+RRyhQaTB3DjdtMiXG
 iZlSXd0dIHtCM7UJ3pCKBbtoUyzwqdliogj3kOkYBtwoFTzVLoSIcFaJSdZy0M1Z38p12ntep9V 2cI4Maina8yM/cQ==
X-Mailer: b4 0.14.3
Message-ID: <20260306-binder-netlink-v1-2-daceb5bc83f2@google.com>
Subject: [PATCH 2/4] ynl_gen: generate Rust files from yaml files
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	netdev@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

To generate netlink frames from Rust code easily, generate Rust
libraries with methods for generating different netlink messages as
appropriate.

The new 'rust' type corresponds to a Rust version of the C target
'kernel'. There is no Rust version of the 'uapi' target since Rust code
exports its uapi via C headers - choice of language is opaque to
userspace.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 tools/net/ynl/pyynl/ynl_gen_c.py | 132 ++++++++++++++++++++++++++++++++++++++-
 tools/net/ynl/ynl-regen.sh       |   2 +-
 2 files changed, 132 insertions(+), 2 deletions(-)

diff --git a/tools/net/ynl/pyynl/ynl_gen_c.py b/tools/net/ynl/pyynl/ynl_gen_c.py
index 0e1e486c1185..5ddc8f84c4a3 100755
--- a/tools/net/ynl/pyynl/ynl_gen_c.py
+++ b/tools/net/ynl/pyynl/ynl_gen_c.py
@@ -19,6 +19,7 @@ import pathlib
 import os
 import re
 import shutil
+import subprocess
 import sys
 import tempfile
 import yaml as pyyaml
@@ -1744,6 +1745,19 @@ class CodeWriter:
         else:
             self.p('}' + line)
 
+    def array_start(self, line=''):
+        if line:
+            line = line + ' '
+        self.p(line + '[')
+        self._ind += 1
+
+    def array_end(self, line=''):
+        if line and line[0] not in {';', ','}:
+            line = ' ' + line
+        self._ind -= 1
+        self._nl = False
+        self.p(']' + line)
+
     def write_doc_line(self, doc, indent=True):
         words = doc.split()
         line = ' *'
@@ -3415,10 +3429,119 @@ def find_kernel_root(full_path):
             return full_path, sub_path[:-1]
 
 
+def render_rust(family, cw):
+    cw.p('#![allow(unreachable_pub, clippy::wrong_self_convention)]')
+    cw.p('use kernel::netlink::{Family, MulticastGroup};')
+    cw.p('use kernel::prelude::*;')
+    cw.nl()
+
+    family_upper = c_upper(family.ident_name)
+    family_name = f'{family_upper}_NL_FAMILY'
+    mcgrps_name = f'{family_name}_MCGRPS'
+
+    cw.p(f'pub static {family_name}: Family = Family::const_new(')
+    cw._ind += 1
+    cw.p('&crate::THIS_MODULE,')
+    cw.p(f'kernel::uapi::{family.fam_key},')
+    cw.p(f'kernel::uapi::{family.ver_key},')
+    cw.p(f'&{mcgrps_name},')
+    cw._ind -= 1
+    cw.p(');')
+    cw.nl()
+
+    if family.mcgrps['list']:
+        cw.array_start(f'static {mcgrps_name}: [MulticastGroup; {len(family.mcgrps["list"])}] = ')
+        for grp in family.mcgrps['list']:
+            cw.p(f'MulticastGroup::const_new(c"{grp["name"]}"),')
+        cw.array_end(';')
+        cw.nl()
+
+    for idx, (op_name, op) in enumerate(item for item in family.msgs.items() if 'event' in item[1]):
+        struct_name = op_name.capitalize()
+
+        if 'doc' in op:
+            doc_lines = op['doc'].strip().split('\n')
+            for line in doc_lines:
+                cw.p(f'/// {line.strip()}')
+
+        cw.block_start(f'pub struct {struct_name}')
+        cw.p('skb: kernel::netlink::GenlMsg,')
+        cw.block_end()
+        cw.nl()
+
+        cw.block_start(f'impl {struct_name}')
+        cw.p('/// Create a new multicast message.')
+        cw.p('pub fn new(')
+        cw._ind += 1
+        cw.p('size: usize,')
+        cw.p('portid: u32,')
+        cw.p('seq: u32,')
+        cw.p('flags: kernel::alloc::Flags,')
+        cw._ind -= 1
+        cw.block_start(') -> Result<Self, kernel::alloc::AllocError>')
+        cw.p(f'const {op.enum_name}: u8 = kernel::uapi::{op.enum_name} as u8;')
+        cw.p('let skb = kernel::netlink::SkBuff::new(size, flags)?;')
+        cw.p(f'let skb = skb.genlmsg_put(portid, seq, &{family_name}, {op.enum_name})?;')
+        cw.p('Ok(Self { skb })')
+        cw.block_end()
+        cw.nl()
+
+        cw.p('/// Broadcast this message.')
+        cw.block_start('pub fn multicast(self, portid: u32, flags: kernel::alloc::Flags) -> Result')
+        cw.p(f'self.skb.multicast(&{family_name}, portid, {idx}, flags)')
+        cw.block_end()
+        cw.nl()
+
+        cw.p('/// Check if this message type has listeners.')
+        cw.block_start('pub fn has_listeners() -> bool')
+        cw.p(f'{family_name}.has_listeners({idx})')
+        cw.block_end()
+
+        attr_set_name = op['attribute-set']
+        attr_set = family.attr_sets[attr_set_name]
+        event_attrs = op['event']['attributes']
+
+        for attr_name in event_attrs:
+            attr = attr_set[attr_name]
+            method_name = attr_name.replace('-', '_')
+
+            if attr.type == 'u32':
+                put_fn = 'put_u32'
+                arg_str = ', val'
+                method_args = '(&mut self, val: u32)'
+            elif attr.type == 'string':
+                put_fn = 'put_string'
+                arg_str = ', val'
+                method_args = '(&mut self, val: &CStr)'
+            elif attr.type == 'flag':
+                put_fn = 'put_flag'
+                arg_str = ''
+                method_args = '(&mut self)'
+            else:
+                put_fn = 'put_u32'
+                arg_str = ', val'
+                method_args = f'(&mut self, val: {attr.type})'
+
+            cw.nl()
+            if 'doc' in attr.yaml:
+                doc_lines = attr.yaml['doc'].strip().split('\n')
+                for line in doc_lines:
+                    cw.p(f'/// {line.strip()}')
+
+            cw.block_start(f'pub fn {method_name}{method_args} -> Result')
+            cw.p(f'const {attr.enum_name}: c_int = kernel::uapi::{attr.enum_name} as c_int;')
+            cw.p(f'self.skb.{put_fn}({attr.enum_name}{arg_str})')
+            cw.block_end()
+
+        cw.block_end()
+        cw.nl()
+    cw.p(' ')
+
+
 def main():
     parser = argparse.ArgumentParser(description='Netlink simple parsing generator')
     parser.add_argument('--mode', dest='mode', type=str, required=True,
-                        choices=('user', 'kernel', 'uapi'))
+                        choices=('user', 'kernel', 'uapi', 'rust'))
     parser.add_argument('--spec', dest='spec', type=str, required=True)
     parser.add_argument('--header', dest='header', action='store_true', default=None)
     parser.add_argument('--source', dest='header', action='store_false')
@@ -3471,6 +3594,13 @@ def main():
         render_uapi(parsed, cw)
         return
 
+    if args.mode == 'rust':
+        render_rust(parsed, cw)
+        cw.close_out_file()
+        if args.out_file:
+            subprocess.run(['rustfmt', '--edition', '2021', args.out_file])
+        return
+
     hdr_prot = f"_LINUX_{parsed.c_name.upper()}_GEN_H"
     if args.header:
         cw.p('#ifndef ' + hdr_prot)
diff --git a/tools/net/ynl/ynl-regen.sh b/tools/net/ynl/ynl-regen.sh
index d9809276db98..4f5ceb4fe147 100755
--- a/tools/net/ynl/ynl-regen.sh
+++ b/tools/net/ynl/ynl-regen.sh
@@ -17,7 +17,7 @@ done
 KDIR=$(dirname $(dirname $(dirname $(dirname $(realpath $0)))))
 pushd ${search:-$KDIR} >>/dev/null
 
-files=$(git grep --files-with-matches '^/\* YNL-GEN \(kernel\|uapi\|user\)')
+files=$(git grep --files-with-matches '^/\* YNL-GEN \(kernel\|uapi\|user\|rust\)')
 for f in $files; do
     # params:     0       1      2     3
     #         $YAML YNL-GEN kernel $mode

-- 
2.53.0.473.g4a7958ca14-goog

