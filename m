Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A9C60884
	for <rust-for-linux@vger.kernel.org>; Wed, 24 Jan 2024 11:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706097160; cv=none; b=HG+5+FfAosB9UsHozh7M7ww3E7gcOI88iBGOsQcOFk2KLE+VUREK+2Xc20T37SHbTahZ22d5OScGpCWa5CEbbuTyWEJSxLTsAOUsKYm3BUFnHOj6ircaq5/srC3cab1Uo+OcqCGEMT74jRulZeuLH5nORRJ73DU7PEGfR5nonrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706097160; c=relaxed/simple;
	bh=35TzRf1iqrpO+kvL/ZgrLkZs4y5LkfcAcVg6kR04IWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I54+IcJRJ1OxJuxLVux2fH/Q0G4UuJ5TKafJjq9TBbawaSlirXfdg9f3r1XD6yJXECI+cd+T0lfeDyPBGKbrvIZOBgWomm60B/q5pXd9iytoV7PkqudHmUs0OHsp85GRcPJ9IMvpv3PuA5TZkghYicS7FT+fROhxEnL6SlACs4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (2048-bit key) header.d=mojatatu-com.20230601.gappssmtp.com header.i=@mojatatu-com.20230601.gappssmtp.com header.b=nEefqo6l; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mojatatu-com.20230601.gappssmtp.com header.i=@mojatatu-com.20230601.gappssmtp.com header.b="nEefqo6l"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so4185159a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 24 Jan 2024 03:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20230601.gappssmtp.com; s=20230601; t=1706097158; x=1706701958; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VLT6be+hi95lLZ51yKFnZXpYmPsuirEXuz1rGnx+0do=;
        b=nEefqo6lRRs8PsFFyryxK2G+v0PalBm0C58d+LASKCrT0jU5Q37qtWNI2DUtvmMtiB
         oN9hcO4xj0UNXjg1I3bsX6QmMUrVlJXWJlv4fo8JJ4TwOfcRat4ZP12En8s1bQjdJmjI
         Qc87pu84AXD3nc7ZSMF9k3hPF3xaL54dfGNQu5/gd+S6rm78ul/FXA4WaMlbtwnHHKeh
         iEgBsBuFpb+FVZDNHYmiHjjqLAwv8W9WtF5GTX9+7gl6ZfuyeP8ViMb/XndP8aLATpt/
         Gx2E1jePujDCk93UNiEzv+tY2pQgccHiRf1zwj/a3uvN+3BGM2/wniIpXFHxsezDbGeR
         BgpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706097158; x=1706701958;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VLT6be+hi95lLZ51yKFnZXpYmPsuirEXuz1rGnx+0do=;
        b=pn3s5ycxDam2rXVXp3/azx+ejGx2Oqa1U7Hp1bhPbAqotYYhao+PTDySyzoDW9O9O7
         3jR3UDnBapuuleXs6mwhiv+nr3Fgntp8k5etH9jdAwlcR/WFeUCAf0J9AwtFIgVz20FN
         DYhryyjjIpSJ1r58jTFVl1D5KvKVWXoohwwkEOAULhwLOm9mW/zq/SBBu/QRPLUdd8ia
         VcnusTmRmiDiUPZgsd5pNa+b/AMVoFPRttgjCQ+U6vAgLijcdnFsg3CDlzXLTTlmLFm7
         T5Gl6sFOHF5xjQbskSSjXz51yv1Zetz5zMFVp77P7XYq0CCNOMD2zPr7mMyWiqsfZp1x
         8NrQ==
X-Gm-Message-State: AOJu0YzRMzJBJre+Dvtc/ed5G4k19iTUyEHiKGaxZi8/agPLaz1FFG6H
	mc+0/3WY7TXLXiR4KiDYs6VrtjuwmWgYsJKq7AIeLjVOP75SYZj5e8S7ZAS6JZ3eUxqkhw2diDM
	xBg==
X-Google-Smtp-Source: AGHT+IG0WojltBds3ScEBQLfdRTNLHLC46Dj8NnJDjrDAx0AB2VlvqF+Mzsup9QlGzy+HXif7JahEA==
X-Received: by 2002:a05:6a20:8e10:b0:19a:57d9:526b with SMTP id y16-20020a056a208e1000b0019a57d9526bmr864945pzj.47.1706097158042;
        Wed, 24 Jan 2024 03:52:38 -0800 (PST)
Received: from [192.168.50.25] ([201.17.86.134])
        by smtp.gmail.com with ESMTPSA id fm27-20020a056a002f9b00b006d9af7f09easm13479565pfb.29.2024.01.24.03.52.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jan 2024 03:52:37 -0800 (PST)
Message-ID: <6e12e0c3-3e7a-44cc-8fc1-0e85fa55b3f5@mojatatu.com>
Date: Wed, 24 Jan 2024 08:52:33 -0300
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Suggestions for TC Rust Projects
To: Trevor Gross <tmgross@umich.edu>, Jamal Hadi Salim <jhs@mojatatu.com>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Cong Wang <xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>
References: <CALNs47v8x8RsV=EOKQnsL3RFycbY9asrq9bBV5z-sLjYYy+AVw@mail.gmail.com>
 <CAM0EoM=1C2xWi1HHoD9ihHD_c6AfQLFKYt4_Y=rnu+YeGX7qMA@mail.gmail.com>
 <CALNs47sqEzW831Sjh7WzgaVrLQJmM9b0=8bhkWLrR3592GU4vg@mail.gmail.com>
Content-Language: en-US
From: Pedro Tammela <pctammela@mojatatu.com>
In-Reply-To: <CALNs47sqEzW831Sjh7WzgaVrLQJmM9b0=8bhkWLrR3592GU4vg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24/01/2024 03:10, Trevor Gross wrote:
> On Tue, Jan 23, 2024 at 3:23 PM Jamal Hadi Salim <jhs@mojatatu.com> wrote:
>> [...]
>>
>> I think a good starting point would be tc actions. You can write a
>> simple hello world action.
>> Actions will put to test your approach for implementing netlink and
>> skbs which are widely used in the net stack for both control(by
>> netlink) and the runtime datapath. If you can jump that hoop it will
>> open a lot of doors for you into the network stack.
>> Here's a simple action:
>> https://elixir.bootlin.com/linux/v6.8-rc1/source/net/sched/act_simple.c
>> Actually that one may be hiding a lot of abstractions - but if you
>> look at it we can discuss what it is hiding.
> 
> That sounds great, getting an OOT equivalent should be a feasible
> first step. I will pass the information along.
> 
>> Note: We have written user space netlink code using rust and it was
>> fine but the kernel side is more complex.
> 
> Would that be the code at https://github.com/rust-netlink? 

Not really, we wrote a small low level netlink library for an internal tool.
What Jamal means is that dealing with netlink as it was intended in Rust 
is not a huge hassle[1]. When we were writing the tool we saw that all 
of the existing netlink libraries at the time were doing a serialization 
model, which was not acceptable to us. We wanted to build the message in 
place without any intermediate structs.

The challenging part for the kernel part will probably be the 
abstraction and the interfacing with all the C API that exists to 
validate the netlink attributes which is a must.

As for documentation `man 7 netlink` is pretty complete and the iproute2 
source code is usually a good test suite for responses.

[1]

Take a look at this snippet for instance:

```
#[derive(Default, NetlinkPolicy)]
pub struct P4TCActOpts {
     #[nlattr(nldefs::P4TC_ACT_OPT)]
     sel: nltypes::DynaSel,
}

#[derive(Default, NetlinkPolicy)]
pub struct TCAction {
     #[nlattr_str(nldefs::TCA_ACT_KIND)]
     kind: String,
     #[nlnest(nldefs::TCA_ACT_OPTIONS)]
     opt: P4TCActOpts,
}
```

The NetlinkPolicy trait handles all the boilerplate to construct the 
message in place and in our implementation it's method base:

```
let action = TCAction::default();
action.kind(msg, "foo"); // Adds the attribute `TCA_ACT_KIND` to the msg 
in place
```

It kind of resembles the netlink policies in the kernel, so perhaps the 
above could be a good starting point for the kernel abstraction.


