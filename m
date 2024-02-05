Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D787418E00
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Feb 2024 11:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707133213; cv=none; b=GTJEYk68cW43Y12v5RLlem8d5sLYRvAr62EBsDIZS5gVFh09ujDcTW3BSGLD5HfQNEDMviI1Zz+LnwEvBh2xuHw0CfJMM+sN+Nk1KcGKoI8+EEDMaLq6JtiNmtTvgX5D/r34AVnFA7hbLZBM8AXUylaOD5kxIo1E2FZgNbSr+is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707133213; c=relaxed/simple;
	bh=T+QMp1yb5Kl+LXxptflZtsYyWXGZ2Xu6+tOe15dnOB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RIaVH1d1eZEePNcoLoc1EMoZCSUc4hj3TkQuDx8zcJyqQWaBSbtRVE5pCUv7My3hPZqzPu7JOTMLInRXBD60o2JFNo9acrP6Pr3sd/BlP0+lNPelNGm3nDpihsWyP7xcJ3oM1n+aZkt0MzUx56d4LHI4IiFOnvuBMItmB22vCBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ShKrlXpU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ShKrlXpU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707133210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R7t+tJwuutZmT6qPeUURhi+su2xAQTbDSN3HF1UoMNo=;
	b=ShKrlXpU/UO5Hb6H703YxnNmxLMLemhx61PYZFdw3ZQ4TMXuqvnnHuUtnLeOjHmppuaedq
	0hDBBmvn9dOw2aEmLUdUs68yyEmryQo9Zb2pxH4+/+/MAcpv2IPRSEvIOWcFgTw8/u/Rli
	F2vzVlVEA7nLY6GX4tTgpgB/hO+Qsl0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-N4LKiUboOaC7l2SceoQi4w-1; Mon, 05 Feb 2024 06:40:08 -0500
X-MC-Unique: N4LKiUboOaC7l2SceoQi4w-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-55fbf844bacso2044348a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Feb 2024 03:40:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707133207; x=1707738007;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7t+tJwuutZmT6qPeUURhi+su2xAQTbDSN3HF1UoMNo=;
        b=JhnOMTWaK0bq359cN7Y/+GH3haeu+EDQs71i8vwvAb/ZffJNgbwcaElxxZfNztYrRm
         S8ofbhg6+yojIffLGkCqKtHQA/Ec32MGPwKgoPEBVMT0yHEgTWY19CLRIOOFtT5RMR4p
         6r/Lv5mx4GHKLz1UWWbANVbhMVJjMxuj/jMptJJDMoG8mMQyN/foFnYtjB4QTiBrLv9F
         WhDqLPFi7apgyxvIZXv8df9+KJ/R+f66pSrkKkwLF2thMUc3OP0qeFo8vZRgEdT74/Np
         C8KrQSrYJF3hRro94oDIuPQVPs2QIF/q0YqVIEx21mIyxVEn+d/RvT3LmDcl8C1cKX1O
         Dp3Q==
X-Gm-Message-State: AOJu0YwCSjhq4+POaYL2XsgODcMMH2mvONL8ybbPwRqvH3YbsIMwTMU7
	FsPx96u/GfDEfRKZyLWm1yKyqNFrYqiXBBePGiACi+izrFYLndWYAVtlI0WA+6Oa+YU1DVAcqLe
	lnJnN98Gc9W8Jup7IEMnDY9kPlkCkamHxCvhu1mT5ZLege8BPKOyp7YH56exQQVi5
X-Received: by 2002:a05:6402:174e:b0:560:885e:8bf1 with SMTP id v14-20020a056402174e00b00560885e8bf1mr599765edx.25.1707133207525;
        Mon, 05 Feb 2024 03:40:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFVg/4nmg2p+S8X2+AcbSd7zEmIHTzPXw9B6Y2g6Rfe0nNe6PVAL5Ye+3tMDW4c0HAkrmHh5A==
X-Received: by 2002:a05:6402:174e:b0:560:885e:8bf1 with SMTP id v14-20020a056402174e00b00560885e8bf1mr599756edx.25.1707133207184;
        Mon, 05 Feb 2024 03:40:07 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUL0iX8MWJR4vygWbqHyWjzOOQkpnrO1prSWaNSAAbMrrPI1GxjqxPdvHqXY7w0jGYOEyaUNDEIBGz0IOucDvrFjPgQrLoTAesMdTNlxkl+T3bksXRXUPcaDmwReLdZnxlaTU1zMuArmNbfZzhfkAlHjf7blKjCGp9e3FkjLnmJM3Njb/lp
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b? ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id x12-20020aa7d6cc000000b0056010210438sm2793664edr.32.2024.02.05.03.40.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Feb 2024 03:40:06 -0800 (PST)
Message-ID: <d814c896-9700-42bb-846f-795d0c3e9680@redhat.com>
Date: Mon, 5 Feb 2024 12:40:04 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RfL branch for PCI bindings
To: Andreas Hindborg <a.hindborg@samsung.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Philipp Stanner <pstanner@redhat.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 Greg KH <greg@kroah.com>
References: <929f47e0-8aca-471d-b54f-26908321999b@redhat.com>
 <CGME20240201185509eucas1p253299bc51f92d6be1041765c804246ad@eucas1p2.samsung.com>
 <CANiq72=zcLXOzYbLjNz08s_xN=oC1ZaePnsRigMJLzQONUa5xA@mail.gmail.com>
 <87o7cztais.fsf@samsung.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <87o7cztais.fsf@samsung.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/2/24 11:40, Andreas Hindborg wrote:
> 
> Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> writes:
> 
>> On Thu, Feb 1, 2024 at 4:02 PM Danilo Krummrich <dakr@redhat.com> wrote:
>>>
>>> I'd like to come back to our discussion from the last "Rust for DRM" meeting regarding a
>>> common "rust-pci" branch.
>>>
>>> As discussed, in the context of the Nova project we are interested in using those bindings,
>>> contribute some more (also in the context of Philipp's recent PCI work) and help moving the
>>> code upstream.
>>>
>>> With Nova we should have a driver project which should justify further efforts to upstream
>>> the code.
>>
>> Thanks Danilo!
>>
>> My understanding from the meeting was that Andreas kindly agreed to
>> maintain a `rust-pci` branch in a compilable state (i.e. rebasing it
>> on top of e.g. `rust-next`). I am happy to create the branch already
>> if Andreas is ready, add it to the website, etc.
>>
>> Or if you (Danilo) prefer to drive the branch instead (e.g. because
>> you may have more bandwidth), that is also fine.
> 
> Exactly. I am currently keeping the patches alive for the Rust NVMe
> driver that lives here [1], latest rebase here [2].
> 
> I am not the original author of the Rust PCI patches. As far as I know,
> no one else is maintaining a copy of these patches on top of mainline
> (if there was, I would just use their work).
> 
> I volunteer to extract these patches from the nvme tree into a separate
> pci tree and keep that rebased on mainline + accept fixes and features
> into that tree.

Thanks Andreas, very much appreciated! I think Philipp will start working
with this code soon.

> 
> We can also do it the other way round and I would just rebase nvme on
> top of your pci tree, that is up to you.
> 
> I don't have any plans of sending these patches upstream for now, since
> the NVMe driver is not welcome upstream. If/when Nova or another Rust
> project depending on pci is ready to merge, I would be happy to help
> upstream the pci patches, if that makes sense. Again, you could also do
> it yourself, that is completely up to you. Or perhaps the original
> authors are interested in helping with this - I do not know since it
> never came up.

The idea is to get an early version of Nova upstream and continue the
development upstream. Hence, once  ready, we do intend to upstream the code
in this context. Of course, your help with that will be very welcome.

- Danilo

> 
> We could start out in one configuration and then change later down the
> road if it becomes clear that another config would be more beneficial.
> 
> Best regards,
> Andreas
> 
> 
> [1] https://rust-for-linux.com/nvme-driver
> [2] https://github.com/metaspace/linux/commits/nvme-6.7/
> 

