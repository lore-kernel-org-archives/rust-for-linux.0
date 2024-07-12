Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C46EAC7
	for <rust-for-linux@vger.kernel.org>; Fri, 12 Jul 2024 14:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720796033; cv=none; b=h4zplXFW/+qiLAjKo8Uk2WI/2jqWRveTVUzojH05scyn+cQYdDWOAl5KJafEVufm081V3eXCTcG1zvkOJROVjuAuNpZ5X9TjRr6km4VmSBVWmNGQMMk58qkIyhCzQU32/lyshoOgT2PDdGgaTlSDZJMJv2E+v1oAJ5y7k04XY9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720796033; c=relaxed/simple;
	bh=S19hFP5H0m8SmZvLLDNz6EKsg9QbZl78HGkcE4LnDdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=NNLqpMhi4tHFK9bkQw86uOMKgm6dV6jZmU190kMS1thM3JG9FV1J5+23xYNhJ8KVXxUB/qzgAgPNSSM/mX5ijY3ipIarblH2KgP/FLq+8V+pnMaUZIOrxPbNW5CpMNSiHNXKRHjjbcKVNYmRA1M8uaFqrjv9i1JJ2JeF7Rk7ALA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e3knj9zw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e3knj9zw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720796030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H03nXr4hza2PKemh9fjDZhk1nYAQUKJ0uHQmzsJryOY=;
	b=e3knj9zweYzkyqag16b+dtMkfb4CeQzdiIV9W5sQ01q4TgPTodcT/PeMh1T29hwTnxhwEK
	zt3/Qdd4n2GPh2r6DAc3MFvRtfZU3UM3u8xYUN/P9+KXc3auNPbeke1l8E8j710ek+vGYu
	+yVlQgTu+I2OKevlRYDZ9OPqJ81ALCw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-352-3_mBrs22Ob-NXfhxne8UPA-1; Fri, 12 Jul 2024 10:53:49 -0400
X-MC-Unique: 3_mBrs22Ob-NXfhxne8UPA-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-367990b4beeso1184487f8f.2
        for <rust-for-linux@vger.kernel.org>; Fri, 12 Jul 2024 07:53:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720796028; x=1721400828;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H03nXr4hza2PKemh9fjDZhk1nYAQUKJ0uHQmzsJryOY=;
        b=FNZWR7pryLeZEVlOpnKWCfyxA+o+mmJHT+HPwRYgqIDYx/661N6f0NWwd5vxzavL4l
         rDvNFKy5SpNU5nQUzD3ELV8HXMW31n/UKCj/s6x5EvU8UC42fTjH6fzQnO0/7I9jf6Fg
         yTWsKAAEdB9LliUdr/ICKXIibAYbvq6RetVm7T06XKxX/x5y3RlwCxch9WdS4IoDIlNs
         AMsojAgEXb6MJQQycCPgFHf5POVRMYP//BXvsHEFgFMC6kiQ1GxewV4eAPGeOeJ2KYJl
         Vk0XIT8eRfQEKs5Ytn3UZqIsKs/BAYyduJdW5DkLkQiBLe9VXyM9o8UWJSQolgKwFJuJ
         aCHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVJK50eu9/t8ud1VyrB6PHY5SkfTAuhRBOk0RJa8xiy31kQSXWJCZEGsoPt5kK7d2eWHdaOmBv+VKAZHeDeHDyUFql9JpENWNakfpguDE=
X-Gm-Message-State: AOJu0YyhJHTzaa091wBhm8SD/d8KI9IwXsFWU2R8XPgOqKfp57hFF0wE
	jq7Z1xa52pDQabLeipSCEFFSrvZVnZ8HiVhQV4SUQbYNFHkUOibT4U3pbNDQKqJ8v5Lw2KKO6Qd
	nUDGuwB4XtGORTQ49Ku8gW536McfQjkMIse7rUQJg8/32RuzFk56E7mDauJpUsH9g
X-Received: by 2002:a05:6000:d82:b0:367:96c5:ae70 with SMTP id ffacd0b85a97d-367cea91ff7mr7290428f8f.31.1720796028053;
        Fri, 12 Jul 2024 07:53:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiO0uAs6JxUgrGSU2IZ4WL5eybEQVI96YsUpsBbrQEUNfgqnCbo/oj/8KRpKxRv5+wT8B4bQ==
X-Received: by 2002:a05:6000:d82:b0:367:96c5:ae70 with SMTP id ffacd0b85a97d-367cea91ff7mr7290404f8f.31.1720796027710;
        Fri, 12 Jul 2024 07:53:47 -0700 (PDT)
Received: from cassiopeiae ([2a02:810d:4b3f:ee94:a4d3:4896:56d4:f050])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde7df48sm10448458f8f.1.2024.07.12.07.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 07:53:47 -0700 (PDT)
Date: Fri, 12 Jul 2024 16:53:45 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Steven Price <steven.price@arm.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>, ojeda@kernel.org,
	lyude@redhat.com, robh@kernel.org, lina@asahilina.net,
	mcanal@igalia.com, airlied@gmail.com,
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] drm: panthor: add dev_coredumpv support
Message-ID: <ZpFDeajsuVONbSYJ@cassiopeiae>
References: <20240710225011.275153-1-daniel.almeida@collabora.com>
 <fe84a028-01a8-4987-b1b7-141fb76d263c@arm.com>
 <4344B22F-D859-4C64-A351-69FFB5208362@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <4344B22F-D859-4C64-A351-69FFB5208362@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 12, 2024 at 11:35:25AM -0300, Daniel Almeida wrote:
> Hi Steven, thanks for the review!
> 
> > 
> > This is defining the ABI to userspace and as such we'd need a way of
> > exporting this for userspace tools to use. The C approach is a header in
> > include/uabi. I'd also suggest making it obvious this enum can't be
> > rearranged (e.g. a comment, or assigning specific numbers). There's also
> > some ABI below which needs exporting in some way, along with some
> > documentation (comments may be sufficient) explaining how e.g.
> > header_size works.
> > 
> 
> I will defer this topic to others in the Rust for Linux community. I think this is the first time this scenario comes up in Rust code?
> 
> FYI I am working on a tool in Mesa to decode the dump [0]. Since the tool is also written in Rust, and given the RFC nature of this patch, I just copied and pasted things for now, including panthor_regs.rs.
> 
> IMHO, the solution here is to use cbindgen to automatically generate a C header to place in include/uapi. This will ensure that the header is in sync with the Rust code. I will do that in v2.

You could also just define those structures in a C header directly and use it
from Rust, can't you?

