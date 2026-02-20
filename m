Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3898017A316
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Feb 2026 01:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771550362; cv=pass; b=HQ9N8qEx+bAC/7WXWQZ4iGmjZpppinD6fISHIk+vDw7dMDB9KSw18XEvrId4G5t9iQcQfrouKzbQON33xtWDThG7WPthy4CgTQ3m2dGAPyxKdrJp/TRQDSiQdeoG7SzRELnUH6+N2Aaw8oq2EypImA34v3Ta7Q48ZwrjekOFl4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771550362; c=relaxed/simple;
	bh=wxVPQliT7y1tlNyaDRmJdeHvLMVEy2aDzAdtD3Jyb4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y33Yp0uBoQ0XMyHbs1BbmRTsVvSU97jppEsKozPxdWVPbt6rSjEdMvtG/Xm22IWa+LQd82Bom2Y1rnPDV79FCS8MtEACP0Jsr0YMFAtdsIbz79QA4fzI5LjG043bw9Qlphp2An4I96KJS1NLGlZ79iROlmRbkPbAFG1xS3KSCfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YkT2f3ZX; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YkT2f3ZX"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2b8095668ebso40322eec.2
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Feb 2026 17:19:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771550360; cv=none;
        d=google.com; s=arc-20240605;
        b=TWPkO5m1nhJYzYwcXtB8OYixqVXYqF3zGXUzj0qUdnu7iSu05t4/aaL54LMfsx2iPw
         ZAeCUoLdTSF6C2n7mmmnMVN+lFf6GGEjM/fydbKLBya17v/9Ig6srnEc4U/lJreuXZvJ
         eNTK3HMp6FDKKU8s+xB844DotyPPZkO/ETAB2rIvHXTN8ZNMmDLksUmFgTX79rXFoDFI
         IsjZxf616UEOhmcZxnYVl8cqw/mAuf+Z1iTtPrhhYiGAMCfrrddxAHUbX7i6JXFCoCAP
         CAb9/eRsxZ2YHAk2BVj8gkjLykQH8SUepdwbOACsKIYl3ioC0EQEnmIdTehkDK5zhuXX
         EGBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wxVPQliT7y1tlNyaDRmJdeHvLMVEy2aDzAdtD3Jyb4U=;
        fh=mwOEOnnOIHVfyKUgiyANyMHZ1ZDtYGKwlyED/3yV4tk=;
        b=fiaTmOsBovaBi656PjJShzdt0MzVFeYKH3oxeEOzfrI2Bp9Fue7zs2SpehXUADi30p
         JwC4zPiRgn54nf4qysr/KqErfj4EgsPWvWZ+uj3bHy7Qxq90IFeqJFTADhhqtpbmihhp
         nDz101MA1PF0wH+6zmpvd+RMlGkNmu5dPwhkzz0fmd2pmNpIeQtLFrcMbUNjJmjuoTU1
         FBuIfSXXm699DGjIY0+AP7GZzMCNVaZJ9dghwE2hAz5CSgBwOYJixqjhg0oJilaNO3qH
         UIb1sSzV+6HOIzTVJJ1mgLjG+GrB9z3oLkJwMYWQGVZHHUe94OS2FPMDrOTRGeeNH1DQ
         bBXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771550360; x=1772155160; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxVPQliT7y1tlNyaDRmJdeHvLMVEy2aDzAdtD3Jyb4U=;
        b=YkT2f3ZXsfuEE25XK7ASSLJ7YDuvQevNUZ3nvK+Fm/yWWIUTlufq2rseTZagYLBtNN
         wEYstpdkLI8GbbqY5Mk5+rhd3I736LfEWjqQhWN+02xMHjQvYdSFQy9a3BHCK7744jys
         LD/u9lJHOm1tx4esu2iO27693Vf+qNzdQMQEkUprPmK12FIFH3WyfH+duQH3ZtJhX5Wa
         FuZYUVn77UTiZ7Db+YG5TkdXiTGnLhr0nYVNi6BTX/s0F5vkoCVMxR9krUpG9fXHBH/W
         omIiy/EBnS7GOu0gbv5DKLb5cYBncNaVavVx1X/y1ePIev+1Vr28p6ecNxeXDj4Cao+X
         Egwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771550360; x=1772155160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wxVPQliT7y1tlNyaDRmJdeHvLMVEy2aDzAdtD3Jyb4U=;
        b=iOeWx54ozozxaA8figjxPOo0Ph6VWvLVl4iHdSUAtNMK+4sR13OOQHgiKuLJYQGrzv
         YaJzEFlwcdfkZ+P7qOVzVk+LJSw5l+j2nUJRpwR0VnxfD2qIkufX53+TrZfl4lVfTbnz
         Zh2dkG7FcvaedO1ERKs+sqCeMLt23pRXIp3paovNqywlSO36UlRHdqSt8pdOxOMLVLrQ
         ux/7i5fsqw7GvYmMUyrtK4UbzIjlbedfWhiU2ozbXi+Xj4XBC0aGbxPUli7gown7wZTY
         x4mLGuhNbfOU4IUNXHHRj197L3BHPNxo33zCFwg786jRK4YHnA3Q/tNDpB27av1trOYd
         dbVA==
X-Forwarded-Encrypted: i=1; AJvYcCX4C+o//jXLnH0OAzFjh242cHtMBnCrZXOjU37PAIwM8D/L1MS+UxsFOLN8ueOJhaJZ8hlVpdWUJg/EblR7xQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYxf9cZAtVX4KHyMhxRwSblPfGZfRRnMFFdtNA9TuBHeLGOTOU
	YYr8z7cPRSkrC8yfvZlxX80j/Nb1Ucapdd+6ZKkTUrgLOeIeCrTCCrnaf+dFaooF5fl2E0pnd75
	hVSd6HQWYisFZvYF2tNS2Qpe+4pKyVp8=
X-Gm-Gg: AZuq6aJ9v8FHQZDWCFFzSApxVbaV5KbBhvEZoj5GxWNG7KoiE7UFf5gBbLP40HSVE6W
	7gSXB5engp5Xfk6Uy+ubBctTt2EAFI3kPZBsdE7AGu8oiozqMJ7Da7C9R+LiZaXxUGEeL/B1D87
	hVkOiI/2EwdrAGBkxupAUg2IA9xBVPwfz0AIPnG6qwBT/YBCX3ZvGIWLWabCw3R8PL+sx14DE8C
	uCTlqlmvjuPrFVrRLJ6uySJUgFdhL0bhU2zAPejRD/41bgyhuZbV9m/ATyNw/WafZuEnVwLr/Pr
	9g8N4hZITQn1UJcyodHwc0x7nb58JVyiW+rRN8ymbPJtuPZBgnf+Hmw8x+sfsJHGfkTVM9OsXx0
	K0a/0XF2Fn+DIpqft4gy9HPDw
X-Received: by 2002:a05:693c:3747:b0:2b7:e929:856b with SMTP id
 5a478bee46e88-2baba09fd2dmr4832186eec.5.1771550360125; Thu, 19 Feb 2026
 17:19:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com> <DGIWDQTR76Y5.34L9IHKU2SEKI@kernel.org>
 <eadfa4662f403fa01f19c1c17a435c1a@nvidia.com> <15a193fc-b2b9-476e-a9f6-57e3a210b74f@nvidia.com>
 <DGJ2TNVD8AS7.2P0HYYKKE8CBQ@kernel.org> <4ad9fd6598e2688c88f6ef22c088c683@garyguo.net>
In-Reply-To: <4ad9fd6598e2688c88f6ef22c088c683@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Feb 2026 02:19:07 +0100
X-Gm-Features: AaiRm53I7xSBVJREH3FirrvsTnrCWsVkXbfgOvRoa4QFaRsf9_1Rj3wL1p43FyI
Message-ID: <CANiq72m5=1iB3g4w4-r_eGtbJT6+Xzd7vpp=YvGU7t=y3YevEQ@mail.gmail.com>
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, Dave Airlie <airlied@redhat.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Koen Koning <koen.koning@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, Nikola Djukic <ndjukic@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 20, 2026 at 2:09=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> I don't think so. Most of the kernel crate is doing FFI. We have a `ffi` =
crate
> defining FFI types, we have `CStr`/`CString` which in Rust std is inside =
`std::ffi`,
> etc.

Yeah, I don't love that name either, for similar reasons.

(The entry would still be a sub-entry, either way).

Thanks!

Cheers,
Miguel
