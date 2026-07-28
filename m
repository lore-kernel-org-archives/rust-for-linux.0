Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCE029DB6E
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Jul 2026 01:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785201785; cv=none; b=Z+l7ZfUCSd9QmPO5EkJDkYiIrDkOoXqAanoYdeAy7PuwkFOv/vvBKuZIliTOrp9y7igaBmhz5bGVmpjI+GoTI4UUI+M35Fz4RGwZBK1+D1zeo6wo/EAWpn8JxbKwXO485G+KCEcZ1yWBNsktj21QY/Dj4FAemYDa8jbxV1N6w5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785201785; c=relaxed/simple;
	bh=TLHvuzHrodGC+b0pExwKfms7lnozV02ELftwXRgrIgY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jcnqkNTkFdjmXV7sHYAacjShLeHSt1aHGWZ+hd6aNqxnd2ehPhDj4GNGW6dL70Aynmpuw0pMltL/2TvryFqVElAsQgGM49nk+k+sM0NH6TWs3kavv0cS1W/Pr7UMAxf+5fAUPLP+Q/JSHZ5L0u/CJ8XSy5JHZgQmW79nYh/lgm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rcpassos.me; spf=pass smtp.mailfrom=rcpassos.me; dkim=pass (2048-bit key) header.d=rcpassos.me header.i=@rcpassos.me header.b=HhqFrRpc; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=LLGi85ZV; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rcpassos.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rcpassos.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rcpassos.me header.i=@rcpassos.me header.b="HhqFrRpc";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="LLGi85ZV"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=HhqFrRpcsaUP1MSsGqKjglzcFW5nOPLa8LMy9SYef3iz1X9ekbCm6FmutJDPBseUDrX6S7i5tCDggaZcn9gAXWa3sxYSXNsb1CXdfDQ/CX544wFtkohC+HFxcxdwXo0ug3tYPiEsRKSP55J5knlFLMk3TK7mlDs4vwbOVCoH+6cN8FFpFnyBEnVClLjcxZNLXMBHug/WrTwJUZZMLA0NISMpxJkzmJwZFKkz9RJljqUhlcfnqFc70TQHbBHRD/9hBGC6/OqUP0fmGFCf4MXGZbMxQ+ZLHRPZkifgT50CTrDgTIsSQ/QMSWsC/w4wEw9tjD1MlB165vmEX9y0f0++cg==; s=purelymail3; d=rcpassos.me; v=1; bh=TLHvuzHrodGC+b0pExwKfms7lnozV02ELftwXRgrIgY=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=LLGi85ZVr6rt4qIT+UCxYvsdVlDxb4iRVE3aNMiX2xnJe7+/EwdUKdulpoedGWlRvYou0uXTg+NSBP/LxwWn926+cJizZc+lIiZZSaQN0WgkVbbGYQqtD/kO7i7k8PlRFMPT+LD+8tl8sNrFJCxc9zqPVsxKTVOu+wy+UZM3lWcN1RogbjCshLYfbIH2/o+IL+RIBQZ9N9pNeanJ/mOdD9IN/YSEN8O0VV9rNYQJs/k1U9zH3WSYgzNaz1m0pSHxuHNBdIeN8dkvNIT9M7nMpZoS5UI2bSytqfl7SD4DoayfxXrP4qS7Lw19Ou9ZaDdjslVyXmapN1Fc/pVkAzvH3w==; s=purelymail3; d=purelymail.com; v=1; bh=TLHvuzHrodGC+b0pExwKfms7lnozV02ELftwXRgrIgY=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 45355:7809:null:purelymail
X-Pm-Original-To: rust-for-linux@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 572093400;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 28 Jul 2026 01:22:55 +0000 (UTC)
From: Rafael Passos <rafael@rcpassos.me>
To: rust-for-linux@vger.kernel.org,
	gregkh@linuxfoundation.org,
	arve@android.com,
	tkjos@android.com,
	Christian Brauner <brauner@kernel.org>,
	cmllamas@google.com,
	aliceryhl@google.com
Cc: Rafael Passos <rafael@rcpassos.me>
Subject: [PATCH] rust_binder: speed up get_node_debug_info using lower_bound iter
Date: Mon, 27 Jul 2026 22:22:18 -0300
Message-ID: <20260728012249.3084154-1-rafael@rcpassos.me>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8

Finding the next node in the RBTree can be done more efficiently using
the cursor_lower_bound, as it reduces cost from O(n) to O(log n).

Link: https://github.com/Rust-for-Linux/linux/issues/1249
Suggested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Rafael Passos <rafael@rcpassos.me>
---

(Sorry for the resend, my script missed the list)

Hi, I decided to use the peek_next semantic instead of a loop/break.
Since the iterator should land directly on ptr or greater, I think this
is more elegant this way. But I can change it otherwise.

Thanks,
Rafael


 drivers/android/binder/process.rs | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/pro=
cess.rs
index cdd1a90797266..c0c2112aca1c6 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -1174,10 +1174,15 @@ fn get_node_debug_info(&self, data: UserSlice) -> R=
esult {
=20
         {
             let inner =3D self.inner.lock();
-            for (node_ptr, node) in &inner.nodes {
+            let cursor =3D inner.nodes.cursor_lower_bound(&ptr);
+            if let Some(c) =3D cursor {
+                let (node_ptr, node) =3D c.current();
                 if *node_ptr > ptr {
                     node.populate_debug_info(&mut out, &inner);
-                    break;
+                } else if *node_ptr =3D=3D ptr {
+                    if let Some((_, next_node)) =3D c.peek_next() {
+                        next_node.populate_debug_info(&mut out, &inner);
+                    }
                 }
             }
         }
--=20
2.53.0

