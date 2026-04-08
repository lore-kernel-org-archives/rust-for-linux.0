Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC893B8D76
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Apr 2026 12:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775650860; cv=none; b=Rz81mFTWpY98SdSF9uFc4vnHbNzlC8b6LfqM5J2AAI6QesWR8xHQ70tSPvtRM/3ZowUvKjIxdIYCkzyavhx3+4jqO5ZCwXFNwRv4Rr7XnRjkFAJl+oebEWXMnjrJuMt+VigF8J2IbiHPCbZYsHWjQyehFb7EUO+D9hh6rtNUE3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775650860; c=relaxed/simple;
	bh=wZSfHnb0WFA82Shw+hfej3jBicvTJMZBLptOwNaRHVM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EEXe7u8OLTBq+oyLXK/81J3gCzuE5jEOSpY+WGbrrDyByu+jraO9yJjcrk3YeWMyhtMhKM+Kr0N+6gF4pxRzNDNPqtdt6Lz1g4ODcOaKR9oYMVL1r7+jf4AxCG02vmtXVFGgi2fnXq4ja8LX4Q0a26oj96eZhUjU4jjV7sHYiYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=demiRG6n; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="demiRG6n"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-43b99add7f3so599034f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Apr 2026 05:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775650857; x=1776255657; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XkmVhqTIndPqmzNXhrJEUquBBrmigEyy/3MslXmYI/0=;
        b=demiRG6nEI1CaIBR0j7Cbn9H+teeBr1q91isDFZT+8R5vN1ydo4TUTAWHFFjr1VFRf
         uM0Ql495BWd/iOwo0vvL3ksiDJ4qc/yUZlOYf6oTseKtCrMIB/P9abotxnBc5ZReaeTv
         P4usKjeNLQXtMXalBrz58hmKP8Zl3un0me84a4RreWZSDS66H21s9Zih9CeWXQUrVNn1
         V8eUqLM67G8CUEhwiO8l//JpJXTo7fTWodOi8JT9pqrF1vigWjqMkFIcNx9MOqQWToJu
         eyaqnIFKgZvXd6G/Ex177OL9uwKxR5pfv8fhLnHhEMEZZWaD8IqpeZTOt8P6vGlRPjHx
         JDjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775650857; x=1776255657;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XkmVhqTIndPqmzNXhrJEUquBBrmigEyy/3MslXmYI/0=;
        b=VkC7YncgmTRBvrjfU5zJ7UgWzfz7ZxfkNOCoAfC+KIyZWM5Kyv19firyKGDh17Stzc
         9n+XAJ0j0Gt85yCX/HYtwSQRMb2Kv1DSiP/6F0tWe54RbsFST8rjPEdlhlprSm71Ak/a
         Y3WuUPynCpl68MD7lhgu12GOnxr68GptFg+jZ8+i3QO+lIVYC1KNkdzAShCJmo6oC1No
         HkZRDffEk1pYQEfHKFxG1OOPt4hJLQ5nPpa+6mMqtMuSIjs6pf8ln3+YsDOv3E0xVedR
         j8ZxtKDLtHDNWeBtuBmCwPo63z2JDyviLfww50xT79ICSpSSSx2tiM3yLbMKSaflUMPY
         fQkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYFcil4IFRcSUVUF7grGvTwTTvwMEfFeg95cOKY1+y8xLDZrHt7aaYh59dYZY1JVVW/CfIA4YZrNmPXkuf4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaT2YDEXe+Ee05ESsZ9aMI9WWzPn3AIrqTIeEZV69XLNyM6MAK
	8q7A1nK8demSMHRO1dGqII2LNUgUfHtt1Y8VQti6pfUG6ejtAyTHuRd/N4/vInDTjvVBZQ4v6ux
	6L+tG3VcXQjBpIyIQhA==
X-Received: from wrpd7.prod.google.com ([2002:adf:f2c7:0:b0:43b:465d:97b6])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:401e:b0:43c:cda2:4f2a with SMTP id ffacd0b85a97d-43d28f8df8dmr30840975f8f.4.1775650857410;
 Wed, 08 Apr 2026 05:20:57 -0700 (PDT)
Date: Wed, 08 Apr 2026 12:20:45 +0000
In-Reply-To: <20260408-binder-netlink-v2-0-c0d327d15435@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260408-binder-netlink-v2-0-c0d327d15435@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=7631; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=wZSfHnb0WFA82Shw+hfej3jBicvTJMZBLptOwNaRHVM=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBp1kgkY6hKLbppEH2Jt3n4927kVD63A9S+doFBU
 26tKNv0Am+JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCadZIJAAKCRAEWL7uWMY5
 Rq3aD/9e2btAznxLvztedA8gQSPhb2OdjrzgL0ehqRSj5nIIP2ygd2ctrV5KvSOhvQVjWC9VSn2
 GeawxnqPJFOylVBpsmMBefGtqvn6dQpP5QqT6NFtFW9ebRIrTg5goipwLZ5gthWHguBjWgRE1oO
 W/R+0q4KY9wM4DNjfm1TmFLNHCGtPqJeWqrYz5IJhEuYav4mQfDCvXAKB/Ft5zZaL3rTAzAhI7I
 oBv+07xhiza57bCUNVlKu5RDpC3lD0QVsaCWxpO7XjO/6aRBkAtEleFDN20lHxKCjblilIpzrGi
 BuXglnUIL2JdZ1ajuP0eNVSVDjdhd3QuXjWgAMcCjhCQ7ngdpejZJ1lBBz9WI3lObMZLn47cvAy
 xHnC1RRPMFW8oBvz6HtGgGALi47FxChBnIJLybhUzoHKM4xJf7DDh+YVyg4D1w5XkUMSBo6H7BJ
 k7TXWofSs1ZTqcwc1pr6tqZZiyBQ4FQjceQxKeR9frSkADGyic7huXg35LuJX6BvVD/IrP97PQ7
 TS5HwhrctdRwKNb5FYpxMS3Nr1mngCzsm+Mc0Gepq70XykcHePr4PshYdaZRsC9qx8O9Mr7XmXh
 zry+xv/jUb69MpoORGu5SS8pSU3myK9RP4Wbju0mpaFN2Hh0tt54RZJ1kIapNXWHI+cWu6QhxtJ BoKwBN6CbLJYfTA==
X-Mailer: b4 0.14.3
Message-ID: <20260408-binder-netlink-v2-2-c0d327d15435@google.com>
Subject: [PATCH v2 2/4] ynl_gen: generate Rust files from yaml files
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
 tools/net/ynl/pyynl/ynl_gen_c.py | 132 ++++++++++++++++++++++++++++++++++++++-
 tools/net/ynl/ynl-regen.sh       |   2 +-
 2 files changed, 132 insertions(+), 2 deletions(-)

diff --git a/tools/net/ynl/pyynl/ynl_gen_c.py b/tools/net/ynl/pyynl/ynl_gen_c.py
index 0e1e486c1185..702d34727b6e 100755
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
+        cw.p('let skb = kernel::netlink::NetlinkSkBuff::new(size, flags)?;')
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
2.53.0.1213.gd9a14994de-goog

