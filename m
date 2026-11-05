Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893393;
	b=fYTmbkG/JTq4j1B75Mf1W/eBpY3S2oPrRo7cD7mYS0rbakWLt/4pNkq+6w2QmwDisSeQ
	 rQjoTkrFok15hO+uN1hN5toDRNqkS1aahnX3bv9Co18XKoC614vVvHWpF4ztHUAgAcCJ7
	 Fx8wyIHbBnBV1BL4OeX7pSmWgLYo/fwTvgLJWUlP+2jf8jIOHd8Se6AzroCjT1TQT2JA8
	 EcxqP7vNFT6Pj3gzHtreSLxFcWFob8SKwmbAcWV7yuJ08AEjzv43vdw8yK3rnxYHS35er
	 PL/uwJVHtlVOV+0GrRFfw3tKAiOiO372aSB67ZNziW7KsvLhMzI9QAqnvTU+1JbaH/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893393;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=hG8CO2uN0Z68W8fYIcxaJcV/PhMDcmutuYzNaZH9PJ4=;
	b=Gt3VG3UHbNYa6MIBSlu50EWPVEUrXHKynGZfXZD8ZIo+zNLX2PWeUdeiOSZNB/EKMYV3
	 eMDpCmrReL3aG8tJR2VSZvAskMP/RhOGwZDUTnzYHopgXxgmR6Kd+vhMLIqE0kTwI4s8t
	 QjlOpYf7/KmbD3BrQoABi8j0bOd9UtnGMZPRnQ8W+KRKtg6fPB5gDHIc1pNWIBtGfwqYJ
	 TVxbiJdYVrS3GykbaZi3CpVHUjmdrNqdPc6EXp/YmDnNcKkbHwEXAj+aZAg1BP3vfnEHg
	 zHLfzzryxLH/3fBDZqDEvdjVQxfSOsdf4iATdBbRvoFfatJKP2czwQ87Yaq5QKJhX+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xr1HTX33;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCC2606A31B;
	Thu,  5 Nov 2026 15:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xr1HTX33
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47E3D1F00919;
	Thu,  5 Nov 2026 15:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793893392;
	bh=hG8CO2uN0Z68W8fYIcxaJcV/PhMDcmutuYzNaZH9PJ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Xr1HTX33dJ3+/VCeK5nRteeriSRSqcdGJcvi3ItgQPpvglzJxggn2LoR6mliM2BT5
	 foRVWtoAIZBL0lpm6t8C51ugjvjj0xijwIOG3kalCPVnIIEpN4g8s8vmOIfCbBvoy7
	 3tZ1Y5QZda33TPKlWbuztJH4umhtNAlKfEoNIgg3izOl5Umjj7s2enD6MCDpSC0Mbo
	 9p1Bnb7eQV6okYFk86L6trEH+TF6jNhQ+M8+14s02/rNjaoIifSwa2NRtV9pTc9snG
	 ZcJ7ZXlFQq22WWBFHNke0kbApE30I8grPn5Huw9gEq8C0cYLUAhWxFwbsJcct5r2ku
	 gNy3n8uizkQ0A==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Thu, 05 Nov 2026 16:42:45 +0100
Subject: [PATCH v3 2/2] rust: impl_flags: add bitwise operations with the
 underlying type
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-impl-flags-additions-v3-2-5b17c01c2b15@kernel.org>
References: <20261105-impl-flags-additions-v3-0-5b17c01c2b15@kernel.org>
In-Reply-To: <20261105-impl-flags-additions-v3-0-5b17c01c2b15@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3125; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=/g+4MXeBA3zS4Qufg6kRTDSUm8wtjrnwlXOGYsN3rM0=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBq7KP/IoMmzjLWqvB51LymuiaLcr2VTffqPSWPI
 lN5UUtP5qWJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCauyj/wAKCRD6UCkIqsW9
 0FfbD/wNmhG+Rvw43bCiLWqq0MFJ3VIHu8KvfDV85LoZ1KigvES5mrg1IxfjM61x6fs+cPqd1z2
 Qi4HpmbUa6T6KphbFGK8B5TSIs2DleUV3pG8Tl3UpeclA+uy25ZQsJ+mOQKvraGiGF660Sx7Psq
 UqTKNY7lhHJeGYj89kJ0N9bkvobVoGJjgFboU88w7UcKXn6UJqmwAG7RKDeaWsxiXsIyO7hc+Ug
 bBK8uEeOHML71mQOg57TkbnE4NIiTzsBCJPho+psyZCAzKMSiPU20SUxa6BENYev/r9AVx1Bhl5
 gEnkk8xKNWg/CPHEPX6CToQ0dlICQdFITKW/J+PgsHnIxesRmQUtjGiugRlDMtGdSTFTl4xXue1
 Rus7zrGipAFpIKXgHlHDfDrzvL4084JTIrcxOsACkLRoZldtosWM/t+kVyymnFJwMCyhajzPD55
 tKkMwvQ4PzxUBOdy1Goh8vMLwQuHt7tZjwQBpS0N1/hY9bjSO6JJy28c7DbWSU3eu+WqVUn31Rv
 Pb5Tn9oPn0P0BOqW/1gQmUwMYdtQlx3eIax6rCboLm2D4vVZx/SVMyCc0AwqnkeDPTwEtaMWEYT
 ATzstPL6HNlcImljsls3AQT8PT5xViENikG4S+2sOvYxlP2ktYcFj/Q3/MCDfFAg336D1cfLsy0
 jowsS5zFBJzP1jg==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add bitwise or operations between the flag value enum and the underlying
type, so a flag value can be combined directly into an integer field of a C
struct.

Rust abstractions that configure a C struct assign to a raw integer field,
often conditionally and from more than one place. The upcoming
`block::mq::gen_disk` conversion declares a `Feature` enum with
`impl_flags!` and folds individual flags into `queue_limits::features`.
With only the `From` implementation from the previous patch, that reads:

    let mut lim: bindings::queue_limits = pin_init::zeroed();

    if self.rotational {
        lim.features = Feature::Rotational.into();
    }

    #[cfg(CONFIG_BLK_DEV_ZONED)]
    if self.zoned {
        lim.features |= u32::from(Feature::Zoned);
    }

    if self.write_cache {
        lim.features |= u32::from(Feature::WriteCache);
    }

With this patch:

    let mut lim: bindings::queue_limits = pin_init::zeroed();

    if self.rotational {
        lim.features = Feature::Rotational.into();
    }

    #[cfg(CONFIG_BLK_DEV_ZONED)]
    if self.zoned {
        lim.features |= Feature::Zoned;
    }

    if self.write_cache {
        lim.features |= Feature::WriteCache;
    }

Note the asymmetry of the first assignment to the rest. The plain
assignment can be written `Feature::Rotational.into()`, but the compound
assignments cannot use `.into()`: `u32` implements both `BitOrAssign<u32>`
and `BitOrAssign<&u32>`, so the target type of `.into()` is ambiguous and
inference fails with E0283. Without these implementations, every compound
assignment has to name the underlying type explicitly.

An `as` cast is one way around that, but we try to avoid casts, and unlike
`u32::from` it would keep compiling silently if the field type were
widened.

The other option is a container temporary: accumulate into a `Features`
value using the operators the macro already generates, then assign
`features.bits()` to the field at the end. This requires a new temporary
per flag field we want to assign and clutters the code.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/impl_flags.rs | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/rust/kernel/impl_flags.rs b/rust/kernel/impl_flags.rs
index 052759b8038d..53f6ba5d5952 100644
--- a/rust/kernel/impl_flags.rs
+++ b/rust/kernel/impl_flags.rs
@@ -276,6 +276,22 @@ fn not(self) -> Self::Output {
             }
         }
 
+        impl ::core::ops::BitOr<$flag> for $ty {
+            type Output = Self;
+
+            #[inline]
+            fn bitor(self, rhs: $flag) -> Self::Output {
+                self | <$flag as Into<Self>>::into(rhs)
+            }
+        }
+
+        impl ::core::ops::BitOrAssign<$flag> for $ty {
+            #[inline]
+            fn bitor_assign(&mut self, rhs: $flag) {
+                *self = *self | <$flag as Into<Self>>::into(rhs)
+            }
+        }
+
         impl $flags {
             /// Returns an empty instance where no flags are set.
             #[inline]

-- 
2.54.0


