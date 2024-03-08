Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726371E4A9
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Mar 2024 17:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709919821; cv=none; b=oyqjs4VBRFNnBLk23Ph+pyk60lXNzE5A9+6Gt0aiNyEYAT1bjwiHNnZLxdIyYSEsFDey9IY2EvjG0PnD9NuZIKKgLP9jJtJHNIa74BYEkCfFlupAXklDfDUsHTMT27CMJZ0i0GcOGo1iW30OsMW/2hysw9//FAKXjgd3KHmVucY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709919821; c=relaxed/simple;
	bh=hFUSWFFmmyWn1RqmUB1ojr5F2V/xXuVZyuc0N7Syi9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TU0R4bVcpmIv71BAS1UtYSFpXsj8dlim/Ff3ypJCEZv49QUu2W1o9/BYo908t6cmIuSt9Voe+tN9apEF7TskjJc0JjitHX6epskkDoMLl0L/hMOdnQIe8pGFU1D+0RgCTPTq6w2nGboqopRkuL/oP/f7A/wlUSVY3n/sdXPU1vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KRAda7ll; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KRAda7ll"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709919818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BgxoV2Hrgzb/A6V/S2Y6TiCCisS0IA4uT6cSbSWTv7E=;
	b=KRAda7llLvSTb3mX6n6htQUB055CZIO216kZVHxWVN/jhuR8gg+0yXavezDkvlnKN55ULq
	yutjCvq7LH0U+hojF2hfb+nIi2ZT5kMz7c3DUH6vrfVpq+NK1xfcUn6LEhphAfu/jkklip
	y3ypFs3YZil//twrqSkfp9DKiYAiN5s=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-ATF0p7BAOk2P-K-a6s9Iog-1; Fri, 08 Mar 2024 12:43:37 -0500
X-MC-Unique: ATF0p7BAOk2P-K-a6s9Iog-1
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-1dcb30afc63so22711095ad.1
        for <rust-for-linux@vger.kernel.org>; Fri, 08 Mar 2024 09:43:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709919816; x=1710524616;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BgxoV2Hrgzb/A6V/S2Y6TiCCisS0IA4uT6cSbSWTv7E=;
        b=WX1UfqKVMwGiS87+6kHxsv4K3uRAnW45ngIQs5QB1/aCdyQRBzJ/QogbwI4CQYyMtr
         aB9GYaG26Z8NloJC2GC3xZcZfqbqx27vvplBEY8r8UOzlHPjSu3oVkl31HWkbxS+f2Su
         FyLmtNKP6sKgCA1Xb+Y6Ctp5rMDxNV+FPu9Gg1MJoMd2fa8fXNRPtDNb2ycnwe15cLFL
         T+W/UEjL9Oxre+MXodetOf8Ri4F/rUgWP0cBKqZ2o/Nd/F7Ka7hMtgzN/lG8Ul40GQzc
         KVL6HR1a8GNpf56+c918yTw27s4dzWZj43HmRFH1r4IHCOqgREJqdKKi5ARyDoa48bZl
         Ssuw==
X-Forwarded-Encrypted: i=1; AJvYcCUX48bW95qeJJu1PAeGG+XdhULhd4gwGIgtMPfCfAoFaHcMptGimd3fEKS3iILIE5BPVH/h+oaad3TBEbllxE7KKWQVC8ic8di1RDbzEe8=
X-Gm-Message-State: AOJu0Yy2nLUavPOIr+6/5/DMKCCX9NMsODJ1PtIaaZfGnjQMOdYP25tj
	JnZnABECm/W/QFop+FalG6WEZDP7NB1q1HIAcJTA9NMTClezGvsJf5xz1JYUWAQLKs0V3FrGu14
	ZimmKrXVsak5zqzOZpr4D37/Y8Q1gRieqWNqvZWhzjqPvhxicthCnzLwwO26qDv4g9O12a/x6
X-Received: by 2002:a17:902:da8e:b0:1dc:c9a8:f164 with SMTP id j14-20020a170902da8e00b001dcc9a8f164mr14797680plx.2.1709919815867;
        Fri, 08 Mar 2024 09:43:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAhCNnPlAroTVU39KQKsenuVCMlfPfBUkhsbYt+ss9i09oxboYrlN3iC5Go+DXijqVAO6YNA==
X-Received: by 2002:a17:902:da8e:b0:1dc:c9a8:f164 with SMTP id j14-20020a170902da8e00b001dcc9a8f164mr14797664plx.2.1709919815541;
        Fri, 08 Mar 2024 09:43:35 -0800 (PST)
Received: from ?IPV6:2601:1c0:4600:5080::206? ([2601:1c0:4600:5080::206])
        by smtp.gmail.com with ESMTPSA id u9-20020a1709026e0900b001dd526ff7c6sm3393475plk.80.2024.03.08.09.43.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Mar 2024 09:43:35 -0800 (PST)
Message-ID: <89d92de1-52fd-4336-94e8-14d46adb50e6@redhat.com>
Date: Fri, 8 Mar 2024 09:43:34 -0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: rust traits in kernel
To: Kent Overstreet <kent.overstreet@linux.dev>,
 Thomas Bertschinger <tahbertschinger@gmail.com>
Cc: Ariel Miculas <ariel.miculas@gmail.com>, rust-for-linux@vger.kernel.org
References: <hveywufltgcwqs6gciwuqyse7gv3k6fhvqftnjtc6no76ajdhb@6ro24ggp6qdp>
 <CAPDJoNunCinSA9Y=V5yEiFzTc7QU71Z=XKicJKNCQhDJEm0ROg@mail.gmail.com>
 <20240308003235.GA66553@fedora-laptop>
 <eqixbuwkcqmllbkoszgxxkyo6rj2izq3h5c4m7jtehbbyzqyt5@7upygcsju5ge>
 <20240308014248.GB66553@fedora-laptop>
 <np7mqkkrnpvi4stflwkrrw7uew4fgkt6iqynmoiirxg4sdsjpj@dwnx334lctpk>
From: Josh Stone <jistone@redhat.com>
In-Reply-To: <np7mqkkrnpvi4stflwkrrw7uew4fgkt6iqynmoiirxg4sdsjpj@dwnx334lctpk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/7/24 6:04 PM, Kent Overstreet wrote:
> IntoIterator isn't the only way of getting an iterator. This comes up
> with vectors as well, where often you want to be able to iterate over a
> vector without consuming it.
> 
> So vectors have a .iter() method that returns an iterator that just
> takes a reference to the original vector. I don't think there's a
> standard trait for this "borrowed iterator" method, but it's a standard
> thing for container objects - that's what we'll want to do here.

There's also `impl<T> IntoIterator for &Vec<T>` that does the same thing
as the slice .iter(), and this lets `for x in &vec` work for borrowed
items. So there's not a separate trait, just IntoIterator taking
ownership of a reference instead of the actual container.

