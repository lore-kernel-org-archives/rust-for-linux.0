Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892AA40E8C6;
	Fri,  5 Jun 2026 13:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780665424; cv=none; b=HN70pee7e2hw7/4ERL2gV01r3SvMt7P5Aqj97hhLV1mS+TSPtaljFBDl1hlSmeOKMIC7qquf+Fa/TpO1kGsDLuBCWMKlA/vKp5rjKyUmwuwZbRiJ43cwjgDGbhy1coW0iE9+obRt0271g2qr9Zg9VE4Jfm+28B4EU+Mn2cdqX1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780665424; c=relaxed/simple;
	bh=G0B7x0+WXnXnJT4cSTmiWLedjcER891GZmWUY0QdGIY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jjrYROorF0tP4PsI0Q7hqWSMopplP+Q+z1kN3OF92zvgqz9o5tZPYHCW21hmpd/mgeSOKSPhNJUXSIKtrsyYs0ekvCWpqjGncnxUthwVccrJFzh+0RehfXlBiP8i+CO05GUw4pS+bRVbkqefHPgyASVVw3l7GXHe3kB764sP5eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ax3u3EPX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ax3u3EPX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C201F00893;
	Fri,  5 Jun 2026 13:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780665423;
	bh=fcCjuUru8qTXLkH3/T8ESlrLC11P8BGmZOFpj2vsP7o=;
	h=From:Date:Subject:To:Cc;
	b=Ax3u3EPXLENTWGAYboBH4tq2zMOr7WiV98M7Do0BHavakrpPa7l6cAquUutOqEHHe
	 P4hb+3HJs3W6zepZ30WIcKz1OOakGnWb/IRuSTJBoyIeu0OWt8PzVvZ0ysEb4H9Z+C
	 1Ffs6jrj36s2clh63KlsNIMsRuoYUoA/7Xlzr9n7rbFI+KsIaC6NHbKIny35apPqKI
	 9JQwVLhiQglVVLbHTxRsYPrncKLTiS51YSn0CbLFcjOjwDDP7z/KWJCfqWKc037ki+
	 ZF4YERONphkDNS75+21xV9vCsDgz8WNSEinqHOhnLPh3hFLARPa3bzfIru/+H/g3/s
	 MSJ+qM0UgSeZw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 05 Jun 2026 15:16:48 +0200
Subject: [PATCH v2] rust: sync: add `UniqueArc::as_ptr`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260605-unique-arc-as-ptr-v2-1-425476d2abdb@kernel.org>
X-B4-Tracking: v=1; b=H4sIAD/MImoC/32NQQ6CMBBFr0Jm7Zi2FImuvIdhQekAE02BKRAN4
 e5WDuDyveS/v0EkYYpwyzYQWjnyEBKYUwZNX4eOkH1iMMpclNEFLoGnhbCWBuuI4yyYG3JGXb0
 n7SDtRqGW30fzUSXuOc6DfI6LVf/sv9qqUaPzrXW5Lq0ti/uTJNDrPEgH1b7vX3JjN82zAAAA
X-Change-ID: 20260215-unique-arc-as-ptr-32eb209dde1b
To: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Boqun Feng <boqun@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>, Boqun Feng <boqun@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1713; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=G0B7x0+WXnXnJT4cSTmiWLedjcER891GZmWUY0QdGIY=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBqIsxDiOgpsPVccQdzFDiVIq6Uw8YZclysns2CC
 zSObfemJ6eJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCaiLMQwAKCRD6UCkIqsW9
 0K6BEACh7/95FDwd8g/N2AWI7TwqblPql4nP/vawx7ZmNXm7EC8PPgSUh6sIlT9SSdc85XraGLg
 Z6V8CU6gdV47usYhm1cIGMza9+G5U07rs/l0ppToPxXEi7elK4yCXK42tbE4nFkkiRrMEQen/W/
 JEEddjf8ItOIvDVGDLo4EbFikNHOL0vfv2M1AU9VsYsy8NTUNis55WZUhNNiMnyIRp2rMRPpxBb
 8KNimj5TtoOFyh6CwA/t15R5Jy5wNLrCFyhWTrsB681Rnjmhbl7TsVOL8WIC4kycPdZeY1Owzs3
 gWCY0CC/AYRHlTICJW9tpPEixu30JnhQw6T63csc7K8OFOsF0BPN4qx9EDtG3ZvS7lOoSxjuCyY
 i/Hmu4Dx3sAXA79Gmsm/KLx64x0X1jYGGADlGK2b4376IR6lgGU25PI4fP1L6Xa0dcdAjXqs10Y
 +Y/v6BkibUC2FaaLXIAmfx/PZTCHnETJ+j0xtY343LXv0m26CE19iyzuJfO+x18+IOMlF302NvS
 rBfoL2bzltyZ6CznO3dHG6Wa7GcI5IxLYpIyFyA5l/Mffj/s30+7jXXSmg0nwUion+anaUazYIU
 X/Vuz00yTeVQQxbJLQFnF+jHWSZ59LfuWDgjFqNBVGqobrzCMVunQBH6ie5mSTftI+UhTqj86m6
 OyRawistybdjQXQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add a method to `UniqueArc` for getting a raw pointer. The implementation
defers to the `Arc` implementation of the same method.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
Changes in v2:
- Make `UniqueArc::as_ptr` an associated function rather than an inherent method (Benno, Gary).
- Mark `UniqueArc::as_ptr` `#[inline]` (Gary).
- Link to v1: https://msgid.link/20260215-unique-arc-as-ptr-v1-1-bdf4b3174475@kernel.org

To: Miguel Ojeda <ojeda@kernel.org>
To: Boqun Feng <boqun@kernel.org>
To: Gary Guo <gary@garyguo.net>
To: Björn Roy Baron <bjorn3_gh@protonmail.com>
To: Benno Lossin <lossin@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
To: Trevor Gross <tmgross@umich.edu>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 rust/kernel/sync/arc.rs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index 18d6c0d62ce0..b58549d5f269 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -756,6 +756,12 @@ pub fn new_uninit(flags: Flags) -> Result<UniqueArc<MaybeUninit<T>>, AllocError>
             inner: unsafe { Arc::from_inner(KBox::leak(inner).into()) },
         })
     }
+
+    /// Return a raw pointer to the data in this unique arc.
+    #[inline]
+    pub fn as_ptr(this: &Self) -> *const T {
+        Arc::as_ptr(&this.inner)
+    }
 }
 
 impl<T> UniqueArc<MaybeUninit<T>> {

---
base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
change-id: 20260215-unique-arc-as-ptr-32eb209dde1b

Best regards,
--  
Andreas Hindborg <a.hindborg@kernel.org>


