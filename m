Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2C93F39F6
	for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 12:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781527024; cv=none; b=KgkCh3a4FMzZHY7X0hlpMekp5qwV1H6jNWa1fU6DIKVupAJ8zDHIQ+EKKUQIpwOxN+bPxf7FeHBFvdzw/0Gd6FQU9jGrWfwnJtPLLuProMdS7/qSMfIkngmlu4Y6mnAO/+eFtk5OoEzZX5u9Oth6Up2mN1wa/7M4b/yqq9QzJIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781527024; c=relaxed/simple;
	bh=W/GN17J61uJOqwT6ccMv8DLfa681Ryd+FrRXb1/pB2k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=o8f2DIgYfbqpd+qrNeCejt9dseIwpmHI2oLzlYnpQSSvX0Z/WRvudyVkT3yvlBAVgJMsAWUSURdHvm42oWbX6smQl7ucBOYGmUmBvxFIHrr1rjHXZh/Bvz/l31fK6Jay+tIH1nfXIHalgFQiv0WR/nzvnLy23+luulEQjgEtU5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H7U22f8j; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H7U22f8j"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-bf481a6e4e6so270417066b.3
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 05:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781527019; x=1782131819; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PMsk5ACWJdbrMJtqBrFN8lRrYOilmz9ty4jGSL7MEp4=;
        b=H7U22f8jqBE8C/6c3xR2msVcMdeKrFLOlJL5K7B4WkH3FOcyfsV8ChKL6e8KxTDTGp
         RVIOV2FW+3pF0EJprqSQDXepZhyOiLQYT+YfFrFZ9WfwnDth5m+CiFX4d/4vUn84lifd
         rDPibw0GG3rO1RXNK0HSTQ4wVKPcnI/XzfYOd7i2sByanlkPNDpLp9vJ8NYM7gUMvAk3
         5yStQ84/+RbRrO+DwYMWwb1g7wmedMPU5nNvMedSW4+PqeMRTuF3r3qGm2oj31wYr6yu
         rFnAC9oN/CUN7Y+Ihd3fTu8eX2jsTXBdWgf+eMEOy8Wwb/yS2gvmbRE52GBTAnSLsPue
         0orA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781527019; x=1782131819;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PMsk5ACWJdbrMJtqBrFN8lRrYOilmz9ty4jGSL7MEp4=;
        b=q8s2A6IYxEe5FryirQVUSrtwFiH7QD5spne3BBowJ0tOgsJV+6quqQ3zmop2bJpYkE
         VUdK3QWYTnrdzhObzyZuHw4iFCAiaKyfi6H62NfHS5rnBejKTXPujBHrhEJGv+Jhq8Ff
         iKtt0zrwdLZD4L6hy4AXUrdc0pH52dm/gz3tpFHltxivqMa3HX5zwZLTgM9EBjEr/xIQ
         MhGn4Nju0/HxVj7RXByOgUqMXNX0LaptJfqcTRXPwae0Nv7LuFIxL2ieXXajSyKnvFtE
         v13m0WdggR7Lg9NfXhdwbbGshENaxaX10t70Qax1ijUDlVI7Ip4/jIiauB2lgesQM4Z/
         4ntg==
X-Forwarded-Encrypted: i=1; AFNElJ8O3qX5YW73Z0N9MNKnoqF3FZ36h6MxYiUTtorR7qObiOoW/29XbOOOxWEzoPvRX+xpV4jRGOYzRfblN9KMpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIfV6T4brOqKOxKeiDgj7vzcqShQQaFxd0Cd1g5O7MZ38qSxDQ
	oQq8TO/h2voJrIN9lDi57NKe66uF3KQG7aeAeMBeixSI7NEsNXF8jrjPXBbFA93yL2D1sEqMFbb
	3lsNOR0HWpwFKdc/17A==
X-Received: from ejei6.prod.google.com ([2002:a17:906:39c6:b0:bec:daff:36d8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:2d21:b0:beb:8ab8:30ce with SMTP id a640c23a62f3a-bff4a200875mr445206966b.20.1781527018553;
 Mon, 15 Jun 2026 05:36:58 -0700 (PDT)
Date: Mon, 15 Jun 2026 12:36:42 +0000
In-Reply-To: <20260615-binder-noderefs-spin-v3-0-3235f5a3e0a0@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260615-binder-noderefs-spin-v3-0-3235f5a3e0a0@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2731; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=W/GN17J61uJOqwT6ccMv8DLfa681Ryd+FrRXb1/pB2k=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqL/Hl2Sm6/ZSWm6dBjuEA656sm5XiqQTZj6rGt
 VLEj4qxXKeJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCai/x5QAKCRAEWL7uWMY5
 RmojEACVeYEEaLobBIyE3t2e1QON6Ef0qRj+O4qeGJN4qDetmuKEHqRMfTYG+R8MtoBHxlxOm2c
 QiKv642KRu6cbVP12oFTWyLYZ4I3obwWAv0AEPhOx0+chhAPiYmt7ABbUxG0wIRvYKPv5rDD3Oz
 aXMDzHc2SjCLui7SYq+9l3cVTKVklqEPwkP1YJ5KqNOr53+Xn6sn0GJRBTQ3V4iOa8EWqLAmJg/
 U7gakJsiy0CtdG+CGMlVR2YPvjfqxWmZk24eigDOgGWQdfZl6PwIQX1SKmW+87lsXP4Wn+YqYkM
 THV1asxpXAgTA0YigzKunh4TMm+xJHCJ4ppzvnQU3+hHUFwYJbgPI0os67FHNYdEM1p0IVBe0vv
 TDoZC37poTiURDOraN+rlvSWfcMEPOqa8bzsie2vwlWyo0MnerEiWPWR+InYnaXZEwsty/k4LbJ
 x4ZeTfJGc7qTZJkk/JIJhWUcJcdCpZQglCdRA6b6h1DCX+TDdv9d8IDfbLjC3CGYOjeTkf3AVrF
 f+QDO795qg4ndYR5O6OP/FUUEeetegKETifho/fJ11tNtbPQu70bK04jvwFXd2TQyYgxaoTEV/B
 VY5O4CQT5GHCj282rzaV3kXW7CJwkcx0g14POMhjIJfS3pUrahySNP87Ie2inmWLesvQ/DtCfjp bDs9vKQ+GjCSITA==
X-Mailer: b4 0.14.3
Message-ID: <20260615-binder-noderefs-spin-v3-2-3235f5a3e0a0@google.com>
Subject: [PATCH v3 2/6] rust_binder: avoid dropping NodeRef in update_ref()
 under lock
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

In preparation for changing the node_refs lock to a spinlock, move the
cleanup of NodeRefInfo in update_ref() so that it occurs without the
node_refs lock held. This avoids dropping an Arc<Node> with the lock
held. Furthermore, the NodeDeath field is kept in the NodeRefInfo to be
dropped outside the lock as well.

The removal from the rbtree is updated to use remove_node(), which keeps
the rbtree node allocation until after node_refs is unlocked as well.
This is not strictly necessary as it just moves a kfree() outside the
lock, but there's no reason to invoke the kfree() under the lock if we
can easily avoid it, so avoid it.

Reviewed-by: Matthew Maurer <mmaurer@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/process.rs | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 96b8440ceac6..f4f4d45e1ab7 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -942,13 +942,17 @@ pub(crate) fn update_ref(
 
         // To preserve original binder behaviour, we only fail requests where the manager tries to
         // increment references on itself.
+        let _to_free_by_handle;
+        let _to_free_by_node;
         let mut refs = self.node_refs.lock();
         if let Some(info) = refs.by_handle.get_mut(&handle) {
             if info.node_ref().update(inc, strong) {
                 // Clean up death if there is one attached to this node reference.
-                if let Some(death) = info.death().take() {
+                //
+                // We remove the entire `info` below, so no need to remove `death` from `info`.
+                if let Some(death) = info.death().as_ref() {
                     death.set_cleared(true);
-                    self.remove_from_delivered_deaths(&death);
+                    self.remove_from_delivered_deaths(death);
                 }
 
                 // Remove reference from process tables, and from the node's `refs` list.
@@ -957,8 +961,8 @@ pub(crate) fn update_ref(
                 unsafe { info.node_ref2().node.remove_node_info(info) };
 
                 let id = info.node_ref().node.global_id();
-                refs.by_handle.remove(&handle);
-                refs.by_node.remove(&id);
+                _to_free_by_handle = refs.by_handle.remove_node(&handle);
+                _to_free_by_node = refs.by_node.remove_node(&id);
                 refs.handle_is_present.release_id(handle as usize);
 
                 if let Some(shrink) = refs.handle_is_present.shrink_request() {

-- 
2.54.0.1136.gdb2ca164c4-goog

