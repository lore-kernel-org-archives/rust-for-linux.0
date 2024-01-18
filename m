Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4524680
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Jan 2024 00:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705538354; cv=none; b=QUCv0XvmngBciOiTvlrT3lPCum7H36vrm5p35abet7m2NT1vsxITOznon0CEd0yaMfu/cSPOR175ouckFu4s35Jbq/5kKIaUy4ZmKDhZTmnBukHYIMbKLOyu08HwhMBiIgJBe/bJZbqEPq5ydJJLVVQHi+QqznsY/ieKTi1SyCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705538354; c=relaxed/simple;
	bh=5fXV9S1qwrCatcOcOXlqtb1FDKpbGPqat6Ll3hI4ZLw=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=Pgo4EJTnIxZnAmBULc+f1v7foKF7LUz4zFohgVvAxvJihC1ESHa8qH/GlQo3rc9JDgclHbdkxydtyqAtYFpUrbTxAosUxruHkA3mJYPrLAk9KBehe3ltXOi2520Ic8ZyZUzD79Epdi2HZB7SvZKVo+1qytwpEoASKgbrdQQUCb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=QyxP+96F; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="QyxP+96F"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dbedb1ee3e4so9839998276.3
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Jan 2024 16:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1705538352; x=1706143152; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=itoC00wDDFSYZ+IvU/UOh2nE1+jPP3Ry+100SfdsSDE=;
        b=QyxP+96F//A7C4z89yIL3JfDiTa6cyj7ugiHrpJNUy8IckfoROMHpEWxfN6UAejejw
         bdVMyb3f7wpfVjvoubU9iRbbckbjUfAZ3Sg439wZ5tZKGHwdeL0Uqm/H1mdIskMMW4iS
         5lKEQWJZpE3rVMFyvFH2VeSM/lzGbOGiEcNmz2Bw8n7p0gIbYNltmb/qEiZLCoqIZmAx
         c340tSHt/cK2/aCwLgubuVZSllrpN4jyCCVm0YTWl+PBQVWNfebh7BFPboSUlMkJJOZJ
         GcdYIByL4TNDVB6ryVmzfGCPXK8ObIpaPMUCwHNthZiOI/NfzGRezOTogJexJ/A/Apym
         ebLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705538352; x=1706143152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=itoC00wDDFSYZ+IvU/UOh2nE1+jPP3Ry+100SfdsSDE=;
        b=K5eaSYzHfIyqQaqOANeMhivPKwBLdhLTjGwUxAJ68MYJ0OOl/zeelgL4AFOrQh5a/2
         B0mHFV73s8gp/akvqwxOX5hrq3VGt8kY7dFnakQQ4G4NFIuq+veamaBhBUl51KYAxBuT
         Rx2Rm6XD2V9KxspbmItJXRI+Sf5ETepUOCkOcLlz7a1WP35NHscXIIzvb36+LziOPfPf
         HcRb5hE6NfcuXIZayM68wLFbVdmhwF6ZK6WAZC8LVQprtoZ4uPQ66ENU9t3m+7+sW51E
         V7cjd0beKADu5R45DQgXFg7Na5WopIyJjwKv7LaP7/aaXSLgcPG2dHKOHbwC78dEBffL
         F33A==
X-Gm-Message-State: AOJu0YwMtK59XNkM7ZheHbPhAUgKyjWUh1HxFX6CFZdBQrH+PMlxpb8R
	9oCb5XGBcAxz328I9BmS4BuVCERcv6guct3Dpgc8XunblS3Ach0+PPGNpqEI+l7UaUK64bgu/B3
	h7enMT9sxT5Tukq8+ZA8I8Gz3ikZVYeJAqfeaPw==
X-Google-Smtp-Source: AGHT+IGe/Pdfl5chOnwpbeCDqa36Ba4aMYe964LFknfE0Ogax3r9al3t19//MxguiJ1gEQCjcpdvRYjgKV/D/y3YIC8=
X-Received: by 2002:a25:aaf2:0:b0:dc2:3e59:4e32 with SMTP id
 t105-20020a25aaf2000000b00dc23e594e32mr30935ybi.38.1705538351977; Wed, 17 Jan
 2024 16:39:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240116160141.165951-1-kernel@valentinobst.de> <20240116220537.168057-1-kernel@valentinobst.de>
In-Reply-To: <20240116220537.168057-1-kernel@valentinobst.de>
From: Trevor Gross <tmgross@umich.edu>
Date: Wed, 17 Jan 2024 19:39:00 -0500
Message-ID: <CALNs47vyZWExuCy3t9MM5Yxbw19XQB8iem5Ga6O8usGPuZumNg@mail.gmail.com>
Subject: Re: [PATCH 05/13] rust: str: use `NUL` instead of 0 in doc comments
To: Valentin Obst <kernel@valentinobst.de>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 16, 2024 at 5:36=E2=80=AFPM Valentin Obst <kernel@valentinobst.=
de> wrote:
>
> Throughout the module, bytes with the value zero are referred to as
> `NUL` bytes. Adapt the only two outliers.
>
> Signed-off-by: Valentin Obst <kernel@valentinobst.de>
> ---
>  rust/kernel/str.rs | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> index 0a8569594fc3..843ffeec9b3e 100644
> --- a/rust/kernel/str.rs
> +++ b/rust/kernel/str.rs
> @@ -149,13 +149,13 @@ pub const fn as_char_ptr(&self) -> *const core::ffi=
::c_char {
>          self.0.as_ptr() as _
>      }
>
> -    /// Convert the string to a byte slice without the trailing 0 byte.
> +    /// Convert the string to a byte slice without the trailing `NUL` by=
te.
>      #[inline]
>      pub fn as_bytes(&self) -> &[u8] {
>          &self.0[..self.len()]
>      }
>
> -    /// Convert the string to a byte slice containing the trailing 0 byt=
e.
> +    /// Convert the string to a byte slice containing the trailing `NUL`=
 byte.
>      #[inline]
>      pub const fn as_bytes_with_nul(&self) -> &[u8] {
>          &self.0
> --
> 2.43.0
>
>

Reviewed-by: Trevor Gross <tmgross@umich.edu>
