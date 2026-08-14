Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB4C22D4C3
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Aug 2026 21:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786744368; cv=none; b=H/Dl7s3DAhlbIiAXIb5GHq5sO3/G5XhaqJpEVCR8yzkWo6XK1PhbBlNxLEPptKONXWbYTWy9tQIjoLqJewq1x8KabYwXwHwUpuisZmqtIC4yJTNpvNypDQt/qVw6YAhaKuV34i80gtQEvua+Xndz3ZYNKibaNekuW362MIBi4/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786744368; c=relaxed/simple;
	bh=w9ShkCGo1qh4GbHRz36S3R9xnPGL4uqV8z+0B/LXwzI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=igYbAsX7o14bUWCYOjci+o5hJq8H6WvE9HWft6tP7jtEDtJO9rv5PYbZzwH8sMrkXSmrckLa2BFeCtiHkRKiVexrFhLH4OfaloQ3jK/PTeUZcu3KYFcUbQ1bzekbH0HWaKKW47Yph70PHvldUOnm67tyN7eCVuepTwEunwpDBHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rcpassos.me; spf=pass smtp.mailfrom=rcpassos.me; dkim=pass (2048-bit key) header.d=rcpassos.me header.i=@rcpassos.me header.b=ok5+A89q; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=k1txnNy/; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rcpassos.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rcpassos.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rcpassos.me header.i=@rcpassos.me header.b="ok5+A89q";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="k1txnNy/"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=ok5+A89qABYzvfBlzBioQ9W5+l3LWdk5wn5LnC08D2UsPN6n2LZoJBU5mR0jcfbWRXJRELX4f4AaTDz9OJYxmGTY8MXcvxw3iCvvbOHbwXgJPj4icU24HjaQnJ64ZnikJ+JDeV7DtujGb2eyw2vWuTtSKcUI5sw19dQDFSv+hoGettasqrJlAMrRnYIoU083k5bujX7IGvB94g4sgnaA9zKki0x1htSzEmwufOgjTJvn2cHWW6EPcFnzq37vVZaUkxZVjtjlRB3qrxeP8D6vT9QEzwUXH6xXp/zOSXEfDiAkkdRQ8mbPJT5esxrA0dhnESkBYjvo7kVwehrC+0Qx4w==; s=purelymail3; d=rcpassos.me; v=1; bh=w9ShkCGo1qh4GbHRz36S3R9xnPGL4uqV8z+0B/LXwzI=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=k1txnNy/nbwPA9OndaQVw2DGaofcX4YogyDV7TaLm18dUpZV/NAcofeen8g2GWJLrgDYEy4ZTMeKx3GymoZDkF+yMI11Izt3OJIvkvNAemexX6M+p4mTh/7i/VYWRMxwcviFApy2JuDAMNjOfoxglW9zl6Z8PQa83PD7NBx5b804FPFHgAzerRPJgBZMKpt2Ho9otfyvBkMnfn93rd/oYi4TZQy4Ljb/t9r8To+KtufWGVp4UZO3mlIlU5PNAQzfWsQZxTVpeIZ/r5EMMjL/6c7ho2EGc74XmEu1VBXXtGGqm+boylUgTIjB54N1CjIx59ElYSK1Qj7pRBAXgYejzA==; s=purelymail3; d=purelymail.com; v=1; bh=w9ShkCGo1qh4GbHRz36S3R9xnPGL4uqV8z+0B/LXwzI=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 45355:7809:null:purelymail
X-Pm-Original-To: rust-for-linux@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -844773443;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Fri, 14 Aug 2026 21:52:43 +0000 (UTC)
From: Rafael Passos <rafael@rcpassos.me>
To: rust-for-linux@vger.kernel.org,
	aliceryhl@google.com,
	gregkh@linuxfoundation.org,
	arve@android.com,
	tkjos@android.com,
	Christian Brauner <brauner@kernel.org>,
	cmllamas@google.com
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Rafael Passos <rafael@rcpassos.me>
Subject: [PATCH v3] rust_binder: speed up get_node_debug_info using lower_bound iter
Date: Fri, 14 Aug 2026 18:50:57 -0300
Message-ID: <20260814215145.2050599-1-rafael@rcpassos.me>
X-Mailer: git-send-email 2.55.0
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

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Link: https://github.com/Rust-for-Linux/linux/issues/1249
Suggested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Rafael Passos <rafael@rcpassos.me>
---

V1: https://lore.kernel.org/rust-for-linux/20260728012249.3084154-1-rafael@=
rcpassos.me/
Changes from V1:
    - remove the "if/else" block checking if the current>prt.
      The cursor_lower_bound function returns the "key" or the next larger.
      This is indeed better, my check was unnecessary.
    - add a comment about this fact before the cursor_lower_bound

V2: https://lore.kernel.org/rust-for-linux/20260731133253.661634-1-rafael@r=
cpassos.me/
Changes from V2:
    - formatting fixes with rustfmt


 drivers/android/binder/process.rs | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/pro=
cess.rs
index cdd1a9079726..b74c26f041bf 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -1174,11 +1174,10 @@ fn get_node_debug_info(&self, data: UserSlice) -> R=
esult {
=20
         {
             let inner =3D self.inner.lock();
-            for (node_ptr, node) in &inner.nodes {
-                if *node_ptr > ptr {
-                    node.populate_debug_info(&mut out, &inner);
-                    break;
-                }
+            // cursor_lower_bound retrieves the "key" passed or the next e=
xisting larger key
+            if let Some(cursor) =3D inner.nodes.cursor_lower_bound(&(ptr +=
 1)) {
+                let (_, node) =3D cursor.current();
+                node.populate_debug_info(&mut out, &inner);
             }
         }
=20
--=20
2.55.0

