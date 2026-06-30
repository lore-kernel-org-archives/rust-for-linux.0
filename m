Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3204531B80D
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Jun 2026 05:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782798317; cv=none; b=J9MfXVjvtjqHInXDA+S9uAVZcmpfzbMauZbP1Kpq8L3imi/DMRD64vpd3WWqphtxK9Lsyj2RBjfHuYYexyras9ysckEMD/htjI6EyfkqruLzTmwJAMEJatkhe+OWl2Qqa1FNax7YZCVsSCUGd5vMo9dex/mFsd3uHV8zm91scss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782798317; c=relaxed/simple;
	bh=ztzealyqI6xgOkTMvJbT6VMrtOx8sF1MsZ3yt78tkI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dC+oS8YWHCXxBtOvFj+igVp+72sLK9nEgTBfcD4WJIT/+Ts3xd5mcCK3m9H+/6rx2FaRdFG2ErSDVpI5hGfxaD253zheY7nfZMMNdv/QdcYQIFIzWygO4pEt/pSn5d54l65WIRpw5rFKpIO+qP1qqeYT34Vr71QSUHy8qDNoU4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nrqzH6Uk; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nrqzH6Uk"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-13809223fd4so5062513c88.1
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Jun 2026 22:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782798315; x=1783403115; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xie8EscmE8LK37ZpMwS/Fq6rd1I8uHsenBWRCUghSAM=;
        b=nrqzH6UkBMjAQL+cjho1T9cVpK86LlkwQSoTddVf4GLAMFZ6XwC7r1txLgdOBLQ/8V
         z28E8n3MSjyiFw1tibFPYHLAUgZZJQ1LMAt5LKnMDbMdbiO598SGankZrlnIQx74Nh5+
         6R5XERjSH9YeAybji/miOxT6JR65tGq/yIJheUch+fX9WLCnWhu3VlUeh9TvWA/gy2f9
         NwVJByxIYMVM+2VfzYwyoZrDJRpNNSLWGbDpow7rikKa+LPPl/4JeeR+lZdOGLWRK+Xw
         F+TFgIjJ/zJiDCEy75m9j7euVut0svxn+JdOhXCOUZ7hXH+knVTQOg/8lYF+Yfiv+7tv
         npRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782798315; x=1783403115;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xie8EscmE8LK37ZpMwS/Fq6rd1I8uHsenBWRCUghSAM=;
        b=kwDdsZ+PtSwv/cy1QLb1w3p4nmZGTG/eA4BtTLptlRdTuXPLRgCnYYJ0odbbyYW57f
         xstaIODQRDpdQWX669aa8o5Z8pggwMOEpOjNe+JfGxhdNQRL3jiHvYUgNjO1UBYROpnG
         ifLfMWvMnQDgWe8tdylg9rJs+3yjEk63PqVWC8Jl7YJYl8bM4Itt/WFc/wZgTfEvRqu/
         A2/W/zxGpm4dvUkA1LoXFgLtyGZ1RdSF+6HGLWa6fz/5/JBQpmIkVCVbOnPDNWinmD51
         VLEeVHcUw8Wv01U/mURn3Bg0sxwON04MNlDeIAfFsH5kk2uxhnEEWc/Zg2b56B+eS9+E
         8rbg==
X-Forwarded-Encrypted: i=1; AFNElJ8Dg3GFZ/Lj9GvTaI7s30HqxmuA8hNXSED+Ccywp/+LdlKe6uZo09GbARENORB71QbeI/phrphQYCD1WcL+BQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/n/HB6Ps8bF+rQM1TVMb8PKo8lqODpaOghf8GlIssDRf0oTqE
	Hzszfy5cUYK7W8nV7NXr0h96tvx8XF0/IZg1bLCee4d1aj+azNtJn9x0
X-Gm-Gg: AfdE7cmy3lCztTYDlRJ0n97mEMKtbx03W3JaUf+GgjbrRH8/UYkc9TofP/4/Ji82X7b
	2w1a2w/6tcJodM57kqffcQKUZEogGgIoifJYwTnO0c8306xmArl6XJlyJ2uP3c4vb1a8ouljvqP
	KIJhwf0mmzGJ86qBI1VLevUW0ic91NqObXA+5y9NUqYBYeexMMkEbe9idfmyaGyYfufNCTZL1ko
	xRGBcQDEriCo2kJG7jqAXxUJBbNrH/ovJkxomgbSVMXyploy+kpby+2n021TGrS8vjwV8kL3Ywv
	t8hWEBOTbyV78SOZwjR6yQzJ5ACZ4SXwm3Cg9wqt7RfqM/e6QHVWE0tXtin3Vcjf99hzHr1WrwA
	JXxIprr40ZuVtBEjnGCffnuaNDupsgf2eNRP5ctSAlA6V/3E8WvvXiMM3CPBlBJgSPjyUUGvfcp
	Hu6nDriY85wkkhgsn9aLc1aCwV5PV0iHok9IL27IaVUAW03OPdRlvy9uJ7
X-Received: by 2002:a05:7022:ec0c:b0:138:637:6227 with SMTP id a92af1059eb24-13b2a1603famr1467281c88.11.1782798315173;
        Mon, 29 Jun 2026 22:45:15 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2ab0fc83sm3351411c88.3.2026.06.29.22.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 22:45:14 -0700 (PDT)
Date: Tue, 30 Jun 2026 11:15:03 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	daniel.almeida@collabora.com, acourbot@nvidia.com, fujita.tomonori@gmail.com, 
	gregkh@linuxfoundation.org, prafulrai522@gmail.com, tamird@kernel.org, kees@kernel.org, 
	lyude@redhat.com, airlied@gmail.com, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH V16 4/7] rust/powerpc: Set min rustc version for powerpc
Message-ID: <akNXvfSfue7_3tyd@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260520064630.1785283-1-mkchauras@gmail.com>
 <20260520064630.1785283-5-mkchauras@gmail.com>
 <CANiq72nPOMkZXpMpwTLFg4xjFfmyf_O_x2FN_nrNBsxeNu178Q@mail.gmail.com>
 <ahVb4k-2rC4EYZF9@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <aj4gAdy2siBxONpo@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CANiq72=EVsTFkQK3LWrT2Gs5UKKViemGkv1WuitY6NOEtvcsNg@mail.gmail.com>
 <akH6yuDH9ZwXVoVA@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CANiq72mj1P9QykK6vbPK37hZkMLwd7RcgVWEcxxuE=9OL+4bAg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72mj1P9QykK6vbPK37hZkMLwd7RcgVWEcxxuE=9OL+4bAg@mail.gmail.com>

On Mon, Jun 29, 2026 at 11:11:44AM +0200, Miguel Ojeda wrote:
> On Mon, Jun 29, 2026 at 6:57 AM Mukesh Kumar Chaurasiya
> <mkchauras@gmail.com> wrote:
> >
> > Sure i'll bisect. Meanwhile i would still like to get this upstream.
> 
> It is very early on the cycle -- I would suggest bisecting first.
> 
> But it is up to ppc, of course.
> 
> Cheers,
> Miguel
Sure, I'll bisect it first.

Regards,
Mukesh
