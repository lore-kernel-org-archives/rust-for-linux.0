Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3423EC2D1
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Jun 2026 10:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782469086; cv=pass; b=oV+b2jmp4d8l79wCT/jeTFYSXZN1g1MhdD+aJa/7pgr3vUQrk1fQqWk/BgPdfLknk/M4SyLTf1le27+6OX95XfAf/F7FK2RiZ/+oplx2Rw8+4oS//czsnk4GqImOxOJDRlv4Ig9JwVsSjm95M3nTqDowRH6R58ZXQSW+rNqVwgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782469086; c=relaxed/simple;
	bh=OwEemPqInwbSVk9dzdDs5pHQn5Viy4wnF3S49Fh17/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LLT78w0dyzgBhd3ALsP64mEMoayOpN8wOFuTJPA2aZnbFa0F/IrpJDi8CttOkE3Tyqud0NkcSasgd7Y6fdsQA+dUOS1mcYYUTibvhmvca/tXq/NHOsKi+TjxkYhvPW0eYQffNLgrjxzfRhz12w3ZBK5b1Qe/dlTBG9NuRSHlUaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bDCvf6nu; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bDCvf6nu"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-30bb87c90deso74140eec.3
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Jun 2026 03:18:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782469084; cv=none;
        d=google.com; s=arc-20260327;
        b=GlFoTomZkoNWWzJxLoZdZKg3t3kPeoziXLponnvjsla+QMAGfxjJnt1LD2PKSf3Rj2
         NiH/sHX4WNOfsBl/DJj/xOg1/Knr7CEfG0my5jJ1ULwXzoZID4ablaq70/1vzJENbnBE
         6hIWlowSIk5K5VBjWvYCR4xqj5axSOmREMOsA+QelMPEb6pTgGqsTqsOcroD/C41BV+v
         el2Y1iDG+eMVDsfUfo/W584ptjthIC9yGWjooDxvox/6y8hMckhy3mw0nOQTyo7P37dy
         V11orjFLSzOeKajkolW18yT4tW+Id5ENOkjtCqGwtQ/dMspvwf6DLzHFuuIUEht4N20f
         oGJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OwEemPqInwbSVk9dzdDs5pHQn5Viy4wnF3S49Fh17/k=;
        fh=xScWFTrsVLQJu1STJOFo8TfdJRLhb1wST8d9o5pXlKA=;
        b=TzHwXOIlXm90lGQ44OyvKC1gUVBDtScvkgik6ZC2iGXV32m2LbSX3FS5ZawGl0uBbD
         GXagxRxlbmyyhtQ3qylOCd9Q6iskgTsRo9GO7qhUFNnZYF2wbpKd9f1rRb/xS4jBIS7I
         3DajhHW18oPb4TI+ETUGBBHi8WXc2e+RnML2EUz8/EyXSiMHyH0eY6x5hHEmQokDwEkE
         ppn3eEn43ualk2A5MDJOb/1IMJsKhjZt32LQ0ZEfg+KInh+OGzErGxfl+IS0M4/rXLfD
         kFsbqwEUkg0OIoatP2EYWseWvZbx3JQH/qdZmYEMbTLPRAOxWo/KliscBMc6zZVGRXKi
         Cq+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782469084; x=1783073884; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OwEemPqInwbSVk9dzdDs5pHQn5Viy4wnF3S49Fh17/k=;
        b=bDCvf6nunsAjyPPOmI+cyTDpZr8edM5afUl1TKWJVezhDgrRTTUnPa7pifmSeaMy5s
         cOr4pSJP6yKtx7jPYwSwclKGUTR/QgEa4AJBwdp2exiYg46YRar1Rsk0qsvpXCuMABgW
         ECgiVdo1sGxvq0dkJ9i2e3QLI6gWmX7yUHn/f7NagKGnVGr0o0hh1sfWTvojGYxCNcD3
         9LeWN9wTvhPXLZdxaRS5kIpbRLfAmj+FlTn+dAfva+Xr+Zd3guJCsSA1mby/dAd6J7xS
         Cup9CTYWYlVjd1ec4AH6+UM0leFXbf0SZNxs1C4RG/hkMXc6VUaD5/X4nZ/HHMPEWQq9
         teWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782469084; x=1783073884;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OwEemPqInwbSVk9dzdDs5pHQn5Viy4wnF3S49Fh17/k=;
        b=Crq29C/Lv4TJ32lf3zATOWrjF9A6bJ27Aw7ZcCKBgeGwN62TcucBMRqfQlQ0uBA8Lf
         T4a2HjnoSsGxN7zbqeEOsx7cPIN5TsM+hpP5l0477MkBqlAJMEUz736fui4MZ5NOt2e5
         vv+cUk8Q+M54KmqgBlc+vgZXZbrqrHI5vG+Y6KsGe7YWRDADtjb8W0Mqnq9g5Pegu38Y
         SdWCNZln0ng5XxAsj4odQy+vsZYCD1GxqV/OwTV1kDeQvtU6aydsRla4wnmIwKpSsPq/
         dccu7+p1AqjCNHHAnntaZQUsni0eW5Ywr3hMCCZH0ngksyI4cKhk47+pQ4BSHOZs5Z6r
         i1LQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr4MlKFGLsGQqufPv3u1e2uunRmD6bM0ldOhxtI37Dhsrot6FOUuzryOGsSecS3RFOnXHPcKgiWgmqGmgbtCg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2heLQE3UU9BT6btWFYBqNPMhXRevgoK07gna8NFpuvGCyYdSn
	j3qZ5aCsr8t3EzSeqhF5M6hNl8fhcO9N0XxpBf29BB4A20HqiIwAi8dQqhGjCBel+Dw5m9sK1kC
	T5+ipnzP6/WOvcYy0Y/++cfVQHbAcfLM=
X-Gm-Gg: AfdE7cnkhE0I0JmV27peLfrfF6eNX/Rbts805jr4eKUS/822zMR0he+vrtvi2K2pUFo
	hd5KeUWEO3zOfVajHnH+8t6PtefkOIyHqMfsaqS6Xv1UcVWYt+Osy0RZfTtcLymnJsvtf3XAlNp
	G3i8fvLazikZ1mA6B44JYO62qKRkGrryt1jiTQZJ1L6XCJ58+z8VcuO/oNpk9yaLemFMyg/UMRv
	u9nt18Bec8KcVW6e2GjLhNV0PPuN6A8gYDpZDrmEjMS9f+zsmBdL2pzwS9DIbm+ORnyZzGqiU03
	nTkHCiu0hdYWsTanFUiuWM9y8XYcqxypa0r3R40sGcIh7ePIfJsiC495i6tdEdh0IY3e6kXLz33
	JnKVkYv0mL1ey
X-Received: by 2002:a05:7300:e6c6:b0:2d5:9438:2a02 with SMTP id
 5a478bee46e88-30c84ad9f55mr3026758eec.1.1782469084327; Fri, 26 Jun 2026
 03:18:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520064630.1785283-1-mkchauras@gmail.com> <20260520064630.1785283-5-mkchauras@gmail.com>
 <CANiq72nPOMkZXpMpwTLFg4xjFfmyf_O_x2FN_nrNBsxeNu178Q@mail.gmail.com>
 <ahVb4k-2rC4EYZF9@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com> <aj4gAdy2siBxONpo@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
In-Reply-To: <aj4gAdy2siBxONpo@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 26 Jun 2026 12:17:50 +0200
X-Gm-Features: AVVi8Ccrx0kRQsHQymdfhdPBE1X5e4EB1kia4xesGjoItezYgW-_bvi72bKccEY
Message-ID: <CANiq72=EVsTFkQK3LWrT2Gs5UKKViemGkv1WuitY6NOEtvcsNg@mail.gmail.com>
Subject: Re: [PATCH V16 4/7] rust/powerpc: Set min rustc version for powerpc
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	daniel.almeida@collabora.com, acourbot@nvidia.com, fujita.tomonori@gmail.com, 
	gregkh@linuxfoundation.org, prafulrai522@gmail.com, tamird@kernel.org, 
	kees@kernel.org, lyude@redhat.com, airlied@gmail.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 8:50=E2=80=AFAM Mukesh Kumar Chaurasiya
<mkchauras@gmail.com> wrote:
>
> This corresponds to a floating point instruction. Although we have
> disabled fpu, vsx and altivec we are still generating these. Seems like
> we have some issue with the rustc here. I didn't dive deeper into this.
>
> Is it ok if we keep 1.95 as base for powerpc64le?

It may be that it is generated but unused (we have that issue
elsewhere -- see e.g. `rust/compiler_builtins.rs`).

Having said that, if 1.95 is fine for the powerpc arch maintainers,
then that is fine (s390 also used a higher minimum -- please see the
recent change in `scripts/min-tool-version.sh`).

But please try to bisect upstream Rust to see where the change
happened, i.e. what is the root cause? e.g. `core` changes, `rustc`
changes, built-in LLVM changes... It could be that it is not tied to
the `rustc` version but LLVM's.

Cheers,
Miguel
