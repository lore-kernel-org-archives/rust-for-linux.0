Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEB16E2CE
	for <rust-for-linux@vger.kernel.org>; Sun, 18 Feb 2024 17:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708276253; cv=none; b=Vm4S6ZqOlta0QdAmdSbIuL2LwXrFily5vEGPVnTJERMICeAa0Pc2BcUujbU/Hn6mk5dxteKxJa3bgSnZuKRhM/j/DrIXtiBoUzL9b2eJLQck5SBpszG/hHR2B3CMrn2vOmT6TqZu25L3DNc5yEUSWxcJnn6vroUat9/Rt+0I0vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708276253; c=relaxed/simple;
	bh=PdDqZK69xcTr0Abar35SSrHpDAPi6invlf8gMlxo3r4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RpNIYnkr3gXPMjjd95kPjOYxZvp61EaSHz6ysrUFLVTfBNA3/HKuWsHP19MElaEvxir4ZhVYLshk4oDTFDlM/2Ssl1LshQYRD3Mt5TE9tOX8dAzdzOu8eZEiSlLUS9W4DGy0FBTHM4Iyj2J6VrSqfcbDirL+2UnP3Z0OA/rvBlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SAS6DGxE; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SAS6DGxE"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6d9f94b9186so2978249b3a.0
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Feb 2024 09:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708276251; x=1708881051; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CfiN6D3FgMXQ0nlnHsPc8ka2AlsHk8v/F3YX8meJkHE=;
        b=SAS6DGxEtGHqY9Loclh97ERrt9yKyt0EAFHxrYmB3syptlYaMNqo1wynzmy782wAJr
         JV2C2vUloIDJgR2YjHawtHsFbA6AQgLBbWWIO6hB84wfQjtzUgBVrTK1tNq6pNz/byUh
         Rqcsf37G8w+Kqm0nf7aVPPv7XEIGGuMpZOKofB3OYlkwfjPHxOJJB9L/nqZr9xHYiM5I
         trQC3PDJ4AnYiOaNoUPMv5o19wQLqkCePbH7Iup0TfRZgnX14ms0gRmYVihC3eH5nrqV
         lrzABn8J39RowvdXMaBhR3c90137Y4CtvB4/pqVx2mKL0ZxkDURFFvpcNFdqtPZ+iIQC
         cXsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708276251; x=1708881051;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CfiN6D3FgMXQ0nlnHsPc8ka2AlsHk8v/F3YX8meJkHE=;
        b=lZvePl8LdfxvmDgpdabhW2ebHD2wcZCh+sNjo/WgGq131FVaCwCDUcph7v6Ijmgllq
         zwcNkRWLBh2DVjgv9+1vjMDi70dvYdQDNYH52TEFKGon85nCuGi+PU/frFQnA2SR1IQ4
         BjgShY8JV4CZQSc7VwMgVYWC/BpEjXrbkRnI0faORXtEUsoQ3iiKHxPGB1b+vlfzfHof
         3G0LJ31vwMsLfLjus8zu4uUwBDgaX8hLhvR2s5rr9tAfOpkvzpwNQaoimjbkFveGEfjQ
         GRsJDR2JnJs+NH0BTV5uKSeQAbXWRVV5Qwkn19SIJWCOnXBYBvQ7p00ymKOpaqSze9MM
         fNVA==
X-Gm-Message-State: AOJu0YzsPg01diNfHeCWozOjrghqrnloDFd0/K287wO7xzLwil2V3iHW
	UW7Tofa+o2DY9cvnbuGy21hotaHJeJIM2O9UO7d5dTSFJumAnrWtO8nOoYHt
X-Google-Smtp-Source: AGHT+IG0A4ms8o3Ei+s8TG3qXIX+QqnvLu8RS2ghxJw+wtyk96S98k3pVeur4EOapxAgDC72iRCfbA==
X-Received: by 2002:a05:6a20:9c8b:b0:1a0:6496:84c1 with SMTP id mj11-20020a056a209c8b00b001a0649684c1mr13629939pzb.37.1708276250827;
        Sun, 18 Feb 2024 09:10:50 -0800 (PST)
Received: from [192.168.54.105] (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id l15-20020a62be0f000000b006e13ce6f4dcsm3212500pff.87.2024.02.18.09.10.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Feb 2024 09:10:50 -0800 (PST)
Message-ID: <1b804b77-d942-4d92-941d-59e72a0b8038@gmail.com>
Date: Sun, 18 Feb 2024 14:10:42 -0300
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: Add `container_of` and `offset_of` macros
Content-Language: en-US
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matt Gilbride <mattgilbride@google.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>
Cc: rust-for-linux@vger.kernel.org, kernel-dev@igalia.com,
 =?UTF-8?Q?L=C3=A9o_Lanteri_Thauvin?= <leseulartichaut@gmail.com>,
 Wedson Almeida Filho <wedsonaf@google.com>
References: <20240217153315.56128-1-mcanal@igalia.com>
From: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
In-Reply-To: <20240217153315.56128-1-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/17/24 12:32, Maíra Canal wrote:
> From: Asahi Lina <lina@asahilina.net>
> 
> Add Rust counterparts to these C macros. `container_of` is useful for C
> struct subtyping, to recover the original pointer to the container
> structure. `offset_of` is useful for struct-relative addressing.
> 
> Co-authored-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> Co-authored:by: Léo Lanteri Thauvin <leseulartichaut@gmail.com>
> Signed-off-by: Léo Lanteri Thauvin <leseulartichaut@gmail.com>
> Co-authored-by: Wedson Almeida Filho <wedsonaf@google.com>
> Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

A handful of authors? So then, it would be sensible to list their
contributions to the patch, though, it could be done when merged.

> [...]
> +/// Calculates the offset of a field from the beginning of the struct it belongs to.
> +///
> +/// # Examples
> +///
> +/// ```rust
> +/// use kernel::prelude::*;
> +/// use kernel::offset_of;
> +/// struct Test {
> +///     a: u64,
> +///     b: u32,
> +/// }
> +///
> +/// assert_eq!(offset_of!(Test, b), 8);

Would've added a check for field `a`, but that's my personal preference.

> +/// ```
> +#[macro_export]
> +macro_rules! offset_of {
> +    ($type:ty, $($f:tt)*) => {{
> +        let tmp = core::mem::MaybeUninit::<$type>::uninit();
> +        let outer = tmp.as_ptr();
> +        // To avoid warnings when nesting `unsafe` blocks.
> +        #[allow(unused_unsafe)]
> +        // SAFETY: The pointer is valid and aligned, just not initialised; `addr_of` ensures that
> +        // we don't actually read from `outer` (which would be UB) nor create an intermediate
> +        // reference.
> +        let inner = unsafe { core::ptr::addr_of!((*outer).$($f)*) } as *const u8;

Curiously enough, you can get the offset of a member of a field struct
per what `addr_of!` does, i.e. if we have a type `Foo` that contains a
struct field `Bar` which has member `qux`, then
`offset_of!(Foo, bar.qux)` will give out an offset too. I don't know if
this applies for `container_of!`. Just saying.

> [...]

Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
