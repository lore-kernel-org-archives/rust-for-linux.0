Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF5545FFCD
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Aug 2026 12:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785932815; cv=none; b=gCYBMH6WTOPZ1bVyD+4WrymEhd+zh2RHZ/T6z35IqN4sDKZHvJPt6l2xjRNi684fMWLSCNGv4NSqH4byWbvdWVwLHOZy7iWy3yLkekCLs1zodIo4R5EQDhSnBbI+9fFgP/oVkspg6ngSmjtAex3KRNBjr8s9lKrb0qO/mbTf5w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785932815; c=relaxed/simple;
	bh=UGcICKdK5wREleej2K1D6G2gBWEregBBuy1tlhv0/Vw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s6p3UgBBOy1RaMtzs2dPhs9C7qkC3q6LGsncAUpQlZZuwV4RsCD/1IqvedaA9XWhzOwYwO1K5nrS5DND1AmoX62nZFI/X0dAv7fkaXHotZeN0bG7T0VHi+0g6cYmXPMEgtdKChqio0VnbjxQWAp0JnwoWohJknHM+RVITBZ5R3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bI+NKeFB; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bI+NKeFB"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38759bcd877so951297a91.2
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Aug 2026 05:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785932813; x=1786537613; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4zSS6W/f7vcLMC+n78G1WtF8yNf9UtnQtPxTkVsbxTU=;
        b=bI+NKeFBTs9P+uZ8wMl29R8nDHQMC/vVeJMR23leBGb7tr/A8G5p+EuZm3ldi7xh/Y
         R8xuTY5CjjL3IVxOCpWbkOR1WsTAW/ciCWph5c/pHMXyNbtFWlG1EehXvCbIKv5E65is
         LLl0/92Myf45/FSyar4aAKqQBAGxhALQyp4XzDeiUR9glEFkatgnECgucUIcvn65cnLV
         Ko6dRQGWL0EK8sOFuzwU6O+JnMPlmlx3s4GxMeU3J8+Ru+rCC6YJFW6tp/wnDrPwP/2H
         /zqZkvDlzG7UKM9pM/re+MTYj1MfFJNxUpn8D/Yv5qCRZ7NKrbIK/vDyzXI5a5Oppmkj
         VAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785932813; x=1786537613;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4zSS6W/f7vcLMC+n78G1WtF8yNf9UtnQtPxTkVsbxTU=;
        b=XK/q7lbgAQH6WMUzZe0mE0PsNiddrkWEeCG6Jr/8MBuRLxlXOjvUQhysS1ASCrbniB
         K5A1DuWBV/4q8jhtW3QvrtZHKuucA1vgXcpNUyBFEQX/ujuWUs1va9E4y4RJ04MaKEdH
         cB5g7/ZjNGQyOAaJFoxZ5rYKHp8bpE9ruYo0iCTxjuGy3MFyG6bU2GY2wM3Sv51CZp0i
         dk4NSDPOXf2CLJgwPY5p5QlB4MOBv6xJQFvG/Q7yNPwBt6gn3j7WtaJGjRjah5/TiMMk
         w6oAu9OOOOzVX9/P1CCjfF/meviaj6jox55jS/LFLRF4BGVo4FYfXLU8rQegUY7vieTr
         Yhwg==
X-Forwarded-Encrypted: i=1; AHgh+RrkNEjr46zY9P0tKcFyYbMQCiqoI6+ly5WrjC/CcJs+XlQNZ1kbSl3uKzfwiFKO2ApalWO80Ec5b57CBLFJ5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFnAwy2mIdHP4hWru69ofMl3mmpeppJELS3VoUjLQQ8q8LZQd2
	jzrLUP8LGINWneHuHziEzzuW6TivQDKMbO8DYmDjQa/GW5Eee/Vq/qZK
X-Gm-Gg: AR+sD12AnRnVZBANuAr8tj4p43z8tK1huSXBfiEq3Je1UARylOr/+f6MUps0ETCqaO2
	enD3cXYi4to/aDpOclv2eIwT5SJ+VgzppCPbyDmG6f9dS6jxcVLlOUGOsgI/fFUGhxgTeonHeLi
	XTMfqncufgwbN5ukp2H5i/vMqfjwkSDB0EJC2FbbM6lXx3WmsQ8WZrrM42JZaQJaqooDPL5uL5+
	A6yoM2vMv+aQGqpel/0rrezZOYjrEMvsaxecjMY7Ym8X05uMr5j9VCDPm7GinFLujJiFMzg3kvZ
	2JhEiMoOJsD5Y4P/X5lM+LkEnW3AnDSXYtlt6Y2H8LFHYYCMnC0KZFKqJPjzefg4h5W6sL2oXPp
	FZOvT8Qlow35NlouKJk0OTeZzI7ymjovdCDfjvhmMQhQT1YsUTwIGFjuq2Nz6wHcBvtsgQBlvOw
	SAxBGTGEn6Q1d6m7f/W1EX2X5dDjoTjjNF1cGEMwWITs2eFNVeGRqOYmPo7s7LDj0GdSpivBDys
	/sTMrkkpc+Iys3RvnbfA3CYHfkQOu0udHfhb3V6NRHAwGo=
X-Received: by 2002:a17:90b:5683:b0:381:26f:8f05 with SMTP id 98e67ed59e1d1-3903c5380f7mr6328805a91.3.1785932813141;
        Wed, 05 Aug 2026 05:26:53 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.161.124])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39039002882sm3109185a91.0.2026.08.05.05.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 05:26:52 -0700 (PDT)
Date: Wed, 5 Aug 2026 17:56:38 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, 
	peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, aliceryhl@google.com, 
	rostedt@goodmis.org, ardb@kernel.org, ojeda@kernel.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, fujita.tomonori@gmail.com, 
	joelagnelf@nvidia.com, gregkh@linuxfoundation.org, prafulrai522@gmail.com, 
	nsc@kernel.org, japo@linux.ibm.com, lina+kernel@asahilina.net, j@jannau.net, 
	airlied@gmail.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH V17 0/7] Rust Support for powerpc
Message-ID: <anMry3IyjSKhuGI3@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260708082454.1254320-1-mkchauras@gmail.com>
 <178574013457.29744.6211258618175255546.b4-ty@linux.ibm.com>
 <anG67Q6Y59kDqh-c@desktop>
 <20260804202217.GA1109939@ax162>
 <anMnoT0KLd5PRGmX@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <anMq59xoOrusKKl2@desktop>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <anMq59xoOrusKKl2@desktop>

On Wed, Aug 05, 2026 at 02:21:59PM +0200, Link Mauve wrote:
> On Wed, Aug 05, 2026 at 05:40:42PM +0530, Mukesh Kumar Chaurasiya wrote:
> […]
> > For these warnings below diff should fix it. I'll send out a patch soon.
> > 
> > diff --git a/rust/uapi/uapi_helper.h b/rust/uapi/uapi_helper.h
> > index 06d7d1a2e8da..acec2d2fede7 100644
> > --- a/rust/uapi/uapi_helper.h
> > +++ b/rust/uapi/uapi_helper.h
> > @@ -6,7 +6,7 @@
> >   * Sorted alphabetically.
> >   */
> >  
> > -#include <uapi/asm-generic/ioctl.h>
> > +#include <uapi/linux/ioctl.h>
> >  #include <uapi/drm/drm.h>
> >  #include <uapi/drm/nova_drm.h>
> >  #include <uapi/drm/panthor_drm.h>
> 
> You likely want to keep the alphabetical sort here.
> 
Yeah, Thanks,

I'll take care of this in the patch.

Regards,
Mukesh

[...]
