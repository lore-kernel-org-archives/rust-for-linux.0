Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CE433B951
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Apr 2026 09:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776245978; cv=none; b=KQMw5lr/LqinN8Gadz2UBuheHWKhfvjsJOLR+LgtrtZcUsfM/Xf5L0gPJsy4EidD3BxgpM8zmKg4DK7eLp/eUeb2/VmUU032e1omg8YGkEhNRu+AwJIC++FRWuTVXfVZ1Uth+76cCKwhXGpY1ZlzAvi53mHYQxy7bwBWRvicGvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776245978; c=relaxed/simple;
	bh=pYERZwVis0sfOfVf5rbB7rXtctv5TUqHOfYeJEFG54Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lr+B4MWEHDW7rhUumwtoaI3nKpc7C0WkNy8RIfgz8YGNV1mAeM4iRRQgHkSrGPeyVi+G7rk7jQa9VUNxOJdj7Q34KVrG7uWQMDakKOGSFwdGi/u76xHJw2Hvf+mDsheOC+WLyFvbhX7nnEIZy915PHYJJkAdGkZKEDFWqfulK5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qeyt6jHZ; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qeyt6jHZ"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-6716a705fc2so3261844a12.3
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Apr 2026 02:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776245975; x=1776850775; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tOHvc+UXkFcaiR1CPEBZRUJAR3W/AL9Q6jZjmIFzwd4=;
        b=qeyt6jHZOG2ZgGMqXaJbJ6LS2+jH5KwB558Btvv4nVXODm8pZhlv8ygd5pWgQUF5BE
         w2SY0Aay6WWhNu4qYdPegtj2QdiUPOLZbPYxLlF5XBZNYkoR+5zYp/fETlPHa+8wrTT6
         BUeSbh0RZrwlP8bsUhtBR0pHmRslU2ueEwbepNerb+LJ4mH32JqF7leSLsvq5v0gfJkQ
         c26K0W76jM1CUsdpzqIX+E1R99HL9IvwdMOKAa4XsRMCb73VyptZDqLb02IrAoT1SrFm
         FgUTcroYX6wdsriZKtmCoUvfO2pE6EyVFL19vglz0FnHVhVIhdDtuBZvdIZv3LbiFSuV
         pOKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776245975; x=1776850775;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tOHvc+UXkFcaiR1CPEBZRUJAR3W/AL9Q6jZjmIFzwd4=;
        b=nd2PvhpvXKwz4+xN9CfzS6iudqtQ5GSE7t4SFM2jNYlvfOjwseLAgxN43XVihWrmlD
         r8xeTAHQFO9vewUl6Qs2aE3N3Gj0YglS0b9bdRgzbZ5kDyj18a95g1sEcWM6VA3G9o1D
         wI4wp9l/sA1gStLjk/P/eQNeHrVOrEZfkjyDe/iG9drwiHIDC6RyUkQKZgfXnQpCY0xE
         StxURJNJBk8YeN0STeaGAi2Q1UbUE622lVwtiVpAdICget0SbwF4SbU+w2spmPE/DB6w
         KPjflD4kWYdP6GyUrPU1/XShPi2N7BlD+++0XCCMBFA/Wfj2uCK9LlyiFH+77hzGEL79
         BSMg==
X-Forwarded-Encrypted: i=1; AFNElJ83lU1iT/Zlru1OtBS1xptUTrTGkrSoOxGghfxvR0WBHNfCf/H8tKFtt6MCqPeVHziQhoBTZ63jhe5gC6WR+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnrKPhhXNh+KaLzcIz9cQttdKFYsei91Xj/TaRsO57CaWg7QWZ
	NRcL4wG35Ty4oXjV/IqjNhsO+hxp+hKc3m3+/QX2tzXnTwjxfAuZuAgivVkgY5kIoMdA8Ng00LH
	1+++0iiy2HQlygQy9DA==
X-Received: from eddo19.prod.google.com ([2002:a05:6402:5613:b0:669:e76e:1fc1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:4409:b0:66d:3ebe:3f18 with SMTP id 4fb4d7f45d1cf-6707a471cffmr10854613a12.25.1776245974941;
 Wed, 15 Apr 2026 02:39:34 -0700 (PDT)
Date: Wed, 15 Apr 2026 09:37:52 +0000
In-Reply-To: <20260415-binder-netlink-v3-0-84be9ba63ee2@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260415-binder-netlink-v3-0-84be9ba63ee2@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=7884; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=pYERZwVis0sfOfVf5rbB7rXtctv5TUqHOfYeJEFG54Y=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBp31zOwI1Z/qaXVGkJIb+gdFwKml7bNTySwX69G
 2ICiC51d42JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCad9czgAKCRAEWL7uWMY5
 RiU7EACgpzsMvxPt41bivzL0Ky3Ir1wanoaWgKiUkEaTa9qcCksjaXn+nwG8UHENQNVUdmjxj0H
 2e+Nixx06lM/jaCHbn+i70GZIdbXOBvpMy88IiFUbhCBkmGnFwkdk2MVNTWxf0IvbIycPVI26EQ
 IVP7dtKeIQmWl2SdAXrNMW5SrG2hMCn3l8qWY6KFxmgY39JhK0QhDyspdiLfKbkAQqa3qzknZ5h
 x6WbRw2MeyFGMo+gkhnPB+yiE8FmqYoY8Aw4vtl4Ryy6r/UWVnKECilnbl8tSjJgT1VhtNJdEWF
 X2dVhEGRpBJWrY5CUT2L3pc/BO0tcekb7m0ubJy+2LUrelV7hxqpwCV7mY/5KiRGaeK8DLIFVOY
 lpnhgie+tdEhRkY3g5LE52t+0scgU2CGFcN82nVUqIK+8l6Rg3HXbbCwKkaPbGNuN7sehlkL/g2
 y8OK2mW9yJzqKQfgFXDeC2SVb0aaoCGRD2jqMCl3ZI4hyumbaTC1cDERa4XDl/SGBgchj0pnyUz
 +e4Y5eah6cbtZ+vZ3/0kexizpAaqwdWRH0NFA7St1gwz092UNWmHn7JXBM1BnATnsQvTmfe6ctp
 tKklg5CoO+DXV/wfX3IRDE7dj3ub2RuIzJynjsWY07mWe7a34rIzDKFaBOwlkWeUzzD3eNxADcf 2sGuJUCBT8rA6Iw==
X-Mailer: b4 0.14.3
Message-ID: <20260415-binder-netlink-v3-2-84be9ba63ee2@google.com>
Subject: [PATCH v3 2/4] ynl_gen: generate Rust files from yaml files
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

This logic is kept in the existing ynl_gen_c.py file to reuse CodeWriter
and other shared pieces of logic in the existing python file. This has
the disadvantage that the gen_c part of the name is now wrong, as it
also generates Rust. One possible solution to this could be to rename
the file.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 tools/net/ynl/pyynl/ynl_gen_c.py | 139 ++++++++++++++++++++++++++++++++++++++-
 tools/net/ynl/ynl-regen.sh       |   2 +-
 2 files changed, 139 insertions(+), 2 deletions(-)

diff --git a/tools/net/ynl/pyynl/ynl_gen_c.py b/tools/net/ynl/pyynl/ynl_gen_c.py
index 0e1e486c1185..76b8b2f1ac16 100755
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
@@ -3415,10 +3429,126 @@ def find_kernel_root(full_path):
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
+    if family.mcgrps['list']:
+        cw.p(f'&{mcgrps_name},')
+    else:
+        cw.p('&[],')
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
+        cw.p('let skb = kernel::netlink::NetlinkSkBuff::new(size, flags)?;')
+        cw.p(f'let skb = skb.genlmsg_put(portid, seq, &{family_name}, {op.enum_name})?;')
+        cw.p('Ok(Self { skb })')
+        cw.block_end()
+        cw.nl()
+
+        grp_idx = 0
+        if 'mcgrp' in op:
+            grp_idx = next(i for i, grp in enumerate(family.mcgrps['list']) if grp['name'] == op['mcgrp'])
+
+        cw.p('/// Broadcast this message.')
+        cw.block_start('pub fn multicast(self, portid: u32, flags: kernel::alloc::Flags) -> Result')
+        cw.p(f'self.skb.multicast(&{family_name}, portid, {grp_idx}, flags)')
+        cw.block_end()
+        cw.nl()
+
+        cw.p('/// Check if this message type has listeners.')
+        cw.block_start('pub fn has_listeners() -> bool')
+        cw.p(f'{family_name}.has_listeners({grp_idx})')
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
+                put_fn = f'put_{attr.type}'
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
@@ -3471,6 +3601,13 @@ def main():
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
2.54.0.rc0.605.g598a273b03-goog

