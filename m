Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4BA397ACA;
	Thu, 15 Jan 2026 12:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768481403; cv=none; b=TDcdreeHUAoufPhhFNtm39YnSJ7N1yd4V3HSyjNQB1C9753REh+/2XALj+3N1oMD8GkkV4e4z0841Fm5zU2r3AlPLS2c0e99eonlah2rJCAVsEQfl3ZhBmQLDut8NQ8gHOgLKVWO95L+9omvDQYxR89/QBCraBybtyHJnqaGinY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768481403; c=relaxed/simple;
	bh=rcLBvLlPy8jrMn9bMBmqroQrrGIm87mmbVOnoHW7iUY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=aZb3JBJtDxsoyhdE5y5QazP719RJWng9CPRNhjtCRt0oVYAyh0fgWlajtafPIUHNiFD2+dZfy3aTHbFwfguCKr31rpEmNvBuJkfhmqy91sNsNm4cSY99u6DNpFKg187TGWs36pfii6F9xEKzg6ZZHk55QXXx5s/cbK14t64c3Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NUOl0zIL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NUOl0zIL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4C2CC116D0;
	Thu, 15 Jan 2026 12:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768481402;
	bh=rcLBvLlPy8jrMn9bMBmqroQrrGIm87mmbVOnoHW7iUY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NUOl0zILEzxJeHHM8bae66h1YkSwZJ8NzRgkQcHYmGhofS9RSODFUVCgC2HPWmyQA
	 V5BOn6tJUE8bKhoVSTC/t9RVYX4our2K+emsIjDPXTPEzj4zB/pcAatO1cn4TW/gqb
	 hB9DSFJmZiQT/wb2/+wFVdtvUaRTONIkFQSLdtQ78lWLB2Srlobmp6GlmWEG5WYTrL
	 lEyFo+ifc7fe8BVlFk46pPiTNPA6liZ3CINJCuczRdXxEnOYB7LYhjAM08iLHBJMgY
	 1TPTLa1eYAY59fWCJS5MrdowRUoCS0jcev0uwOZt0lpM8kfNIrn1xKsERxu+4fDS3r
	 xdBZCspGmgB3w==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Filipe Xavier <felipeaggger@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>
Cc: daniel.almeida@collabora.com, rust-for-linux@vger.kernel.org,
 felipe_life@live.com, linux-kernel@vger.kernel.org, Lyude Paul
 <lyude@redhat.com>, Filipe Xavier <felipeaggger@gmail.com>
Subject: Re: [PATCH v8] rust: add new macro for common bitflag operations
In-Reply-To: <87h5snf4yb.fsf@kernel.org>
References: <2JpjX5S1c2QLiHUftMzVViS7xatVGkJperCPqxJU8ZQ_Opyo4KPge5jcRCPb0Gcgyxb4yeFhm6Y-1X8q3pbNaw==@protonmail.internalid>
 <20260111-feat-add-bitmask-macro-v8-1-3bc0a558ede0@gmail.com>
 <87jyxjf56j.fsf@kernel.org> <87h5snf4yb.fsf@kernel.org>
Date: Thu, 15 Jan 2026 13:49:52 +0100
Message-ID: <87ecnrf3bj.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andreas Hindborg <a.hindborg@kernel.org> writes:

> Andreas Hindborg <a.hindborg@kernel.org> writes:
>
>> "Filipe Xavier" <felipeaggger@gmail.com> writes:
>>
>>> We have seen a proliferation of mod_whatever::foo::Flags
>>> being defined with essentially the same implementation
>>> for BitAnd, BitOr, contains and etc.
>>>
>>> This macro aims to bring a solution for this,
>>> allowing to generate these methods for user-defined structs.
>>> With some use cases in KMS and upcoming GPU drivers.
>>>
>>> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/We.20really.20need.20a.20common.20.60Flags.60.20type
>>> Suggested-by: Daniel Almeida <daniel.almeida@collabora.com>
>>> Suggested-by: Lyude Paul <lyude@redhat.com>
>>> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
>>> Reviewed-by: Lyude Paul <lyude@redhat.com>
>>> Signed-off-by: Filipe Xavier <felipeaggger@gmail.com>
>>
>> Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
>> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
>>
>>
>> I think it would be useful to add:
>>
>> impl Flags {
>>      unsafe from_raw(value: Repr) -> {
>>      ...
>>      }
>> }
>>
>> impl TryFrom<Repr> for Flag {
>>      // Succeed if `value` is a valid `Flag` enum bit pattern.
>> }
>>
>> impl TryFrom<Repr> for Flags {
>>      // Succeed if `value` is the logical OR of valid enum bit patterns.
>> }
>
> Also bitwise operations on the underlying type such as
>
>   impl BitOrAssign<Flag> for u32 {
>   ...
>   }
>
> Not sure if that is possible with the orphan rule, but it would be nice.
> I was trying to
>
>   lim.features |= request::Feature::Rotational;
>
> where `lim: bindings::queue_limits`.

Sorry for the spam. This works for me:

diff --git a/rust/kernel/impl_flags.rs b/rust/kernel/impl_flags.rs
index 0c50b8404fa79..e1143e6381d47 100644
--- a/rust/kernel/impl_flags.rs
+++ b/rust/kernel/impl_flags.rs
@@ -102,6 +102,25 @@ fn from(value: $flags) -> Self {
             }
         }
 
+        impl ::core::convert::From<$flag> for $ty {
+            #[inline]
+            fn from(value: $flag) -> Self {
+                value as _
+            }
+        }
+
+        impl ::core::convert::TryFrom<$ty> for $flags {
+            type Error = ::kernel::error::Error;
+
+            fn try_from(value: $ty) -> Result<Self, Self::Error> {
+                match value & !$flags::all_bits() == 0 {
+                    // SAFETY: We checked above that `value` is a valid bit pattern for `$flags`.
+                    true => Ok(unsafe {::core::mem::transmute(value)}),
+                    false => Err(::kernel::error::code::EINVAL),
+                }
+            }
+        }
+
         impl ::core::ops::BitOr for $flags {
             type Output = Self;
             #[inline]
@@ -225,6 +244,22 @@ fn bitxor(self, rhs: $flag) -> Self::Output {
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
             /// Returns an empty instance of `type` where no flags are set.
             #[inline]


Best regards,
Andreas Hindborg


