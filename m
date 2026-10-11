Received: from smtpout10.mo536.mail-out.ovh.net (smtpout10.mo536.mail-out.ovh.net [51.210.91.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C29E3542F8
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Oct 2026 19:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.210.91.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791748360; cv=none; b=AQxu7JyVVsHCW/5ENppF1haS/GR5LPiYwwuv9eGOldiyH8g/8Zg2QWmFLfqkFHbCiBcbGC9XKr+Vj5+nO4JwD4ewOLkU1NFsUGHogos1PavwWO7qKdfZPXOSs/Aw3wkoHDQubNsdpUubrUBOHoqQT99Fzs1CTBhYGd7ue20Jw5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791748360; c=relaxed/simple;
	bh=gIv48S26TsXJgNxVAg22JLgZLqnohD14Ny2j1rS1OOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rNmu9DEJNQ2OnhcLC/hXs+5sVSYlZ+RkBHv4wM3+AmezgA/6mGY81qcFRBz3p/YeelX9kr3kGG4FL0pRBKnlObpuRLmDQ37mv5qnSLUca1lhrBX121ieH7cy9hdIQXF0nAlOwN47bKD2BCSwe2NrbzF/PqdSxUrmU0t0NmAX4IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=npnm.eu; spf=pass smtp.mailfrom=npnm.eu; dkim=pass (2048-bit key) header.d=npnm.eu header.i=@npnm.eu header.b=gDebjUab; arc=none smtp.client-ip=51.210.91.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=npnm.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=npnm.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=npnm.eu header.i=@npnm.eu header.b="gDebjUab"
Received: from director5.derp.mail-out.ovh.net (director5.derp.mail-out.ovh.net [79.137.60.225])
	by mo536.mail-out.ovh.net (Postfix) with ESMTPS id 4j2r1Z5vC3z88tW;
	Sun, 11 Oct 2026 19:16:34 +0000 (UTC)
Received: from director5.derp.mail-out.ovh.net (director5.derp.mail-out.ovh.net. [127.0.0.1])
        by director5.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
        for <daniel.almeida@collabora.com>; Sun, 11 Oct 2026 19:16:34 +0000 (UTC)
Received: from mta2.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.110.164.42])
	by director5.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4j2r1Z4Xrkz6MbS;
	Sun, 11 Oct 2026 19:16:34 +0000 (UTC)
Received: from npnm.eu (unknown [10.1.6.10])
	(Authenticated sender: laniel_francis@npnm.eu)
	by mta2.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTPSA id CCC4F3E1F84;
	Sun, 11 Oct 2026 19:16:31 +0000 (UTC)
Authentication-Results:garm.ovh; auth=pass (GARM-112S00642d5369b-6819-4b97-8d32-07d59613bd17,
                    D399504B8DAA22F5A3196F0BFCE745750AD202B1) smtp.auth=laniel_francis@npnm.eu
X-OVh-ClientIp:46.177.232.216
From: Francis Laniel <laniel_francis@npnm.eu>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Francis Laniel <laniel_francis@npnm.eu>,
	Timur Tabi <ttabi@nvidia.com>
Cc: Thorsten Blum <blum@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 2/2] rust: uaccess: Use slice::NonEmptySlice in strcpy_into_buf()
Date: Sun, 11 Oct 2026 22:15:12 +0300
Message-ID: <20261011191540.56199-3-laniel_francis@npnm.eu>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011191540.56199-1-laniel_francis@npnm.eu>
References: <20261011191540.56199-1-laniel_francis@npnm.eu>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 16181996412188370390
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFYpmSUVACmnAH0gVYiJK/AGHBDwKlsYRr7+goWsVo2uU/QNb8dja/JviIR1OeKhf6ompLIRVKprC+uybqzJlspoeOCnhjLmv/GXU7hecOzz18oqALiVMyi7cYzK3hmkVQAsHJ9Fr0LUvhODEsfBHWRS0vEofCmEIEXo89tesfCaUxnPd2plQTOzx2lN+beEbrrqXolPMa8TEo/JC6KuOdC91N0IOuiyyFLao6z73c4V1isOgfB4PYe9jmmpQtcwG9CXmUT63U2yfHsqGrEnbx+esokdVcUMZueAz+nQR4JEzvYbxmGpITQ+Z1zc8PqRqVsCwgBG1QCBzBMuNWeQp7HipeDX8XHjtUamwkVTEkUzSI0SxjUX/CBhW6gPLINkPJzwcOfO9e6wObdqJdIkJgX/iLtQXh1OH6svapDoVc7iCVoQyeEtyCgf0+PpqFHIXRvFT/TIKwPPrEUqXscAUR86IYmOztczj3ioD/w6at/gBfOzpnHlhELunxWBkhsKTtnw25hotI37zyaYw4u05KBg3AFFijiAj6zLL/haA0jV7Q/+RZvhfZYzHVTYcianJCd30FetNu1cCAP1NwWref3E5modNK8qVh39RPVE9X/TfMzTgvWH+Xk6RwIqYMQkopoQXifk7enHjBWRzQbkun+VtwxuGrqmPCq1tyxwkaArw
DKIM-Signature: a=rsa-sha256; bh=BHxeoR2o4o42+qXG8b2+JAzqqv2SnVs76amoJDZOaRo=;
 c=relaxed/relaxed; d=npnm.eu; h=From; s=ovhmo-selector-1; t=1791746195;
 v=1;
 b=gDebjUab6qcEUBYwTCTfjlNZnCTWq27eUGAF4XH9Ju8E1VqvZVJ7jWN3MkYc5ag2aaTUMTRh
 kci5ns4hd9E0/5+ICBwkIt/3Km7NqN8iahVWIAiZtSEA1CBd2//Bt4qWkfpokNvDrTonhPK/aIz
 yHASQ6kYwb2+1mFjjgVFGMTvJ/5KNbhwe36DuTWIz78yPuWFzFF8h4uQtlR4fbe/C8l+KDH45o3
 QBHAfiac1O5iVhsB9W2XOCB5SnvdhNHpokt3TeJrIf9GpHo3qBKh0m2UchWbEoYwG7kBOJ+88/I
 WPEeBi+N0Xc6MTPOVcSpYUP1apcYKa4EYJwoEz7LZGWMQ==

This removes an unsafe block in strcpy_into_buf(), the unsafe
block now lies in last_mut() in NonEmptySlice.

Signed-off-by: Francis Laniel <laniel_francis@npnm.eu>
Suggested-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/uaccess.rs | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
index 5f6c4d7a1a51..b6bf9074d67a 100644
--- a/rust/kernel/uaccess.rs
+++ b/rust/kernel/uaccess.rs
@@ -13,6 +13,7 @@
     fs::file,
     prelude::*,
     ptr::KnownSize,
+    slice::NonEmptySlice,
     transmute::{AsBytes, FromBytes},
 };
 use core::mem::{size_of, MaybeUninit};
@@ -390,13 +391,11 @@ pub fn read_all<A: Allocator>(mut self, buf: &mut Vec<u8, A>, flags: Flags) -> R
     /// copied).
     #[doc(alias = "strncpy_from_user")]
     pub fn strcpy_into_buf<'buf>(self, buf: &'buf mut [u8]) -> Result<&'buf CStr> {
-        if buf.is_empty() {
-            return Err(EINVAL);
-        }
+        let buf = NonEmptySlice::new_mut(buf).ok_or(EINVAL)?;
 
         // SAFETY: The types are compatible and `strncpy_from_user` doesn't write uninitialized
         // bytes to `buf`.
-        let mut dst = unsafe { &mut *(core::ptr::from_mut(buf) as *mut [MaybeUninit<u8>]) };
+        let mut dst = unsafe { &mut *(core::ptr::from_mut(&mut **buf) as *mut [MaybeUninit<u8>]) };
 
         // We never read more than `self.length` bytes.
         if dst.len() > self.length {
@@ -422,9 +421,7 @@ pub fn strcpy_into_buf<'buf>(self, buf: &'buf mut [u8]) -> Result<&'buf CStr> {
             // This means that we filled the buffer exactly. In this case, we add a NUL-terminator
             // and return it. Unlike the `len < dst.len()` branch, don't modify `len` because it
             // already represents the length including the NUL-terminator.
-            //
-            // SAFETY: Due to the check at the beginning, the buffer is not empty.
-            unsafe { *buf.last_mut().unwrap_unchecked() = 0 };
+            *buf.last_mut() = 0;
         }
 
         // This method consumes `self`, so it can only be called once, thus we do not need to
-- 
2.47.3

