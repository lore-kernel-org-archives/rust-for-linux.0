Received: from fgw21-4.mail.saunalahti.fi (fgw21-4.mail.saunalahti.fi [62.142.5.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398562D46C8
	for <rust-for-linux@vger.kernel.org>; Mon, 22 Dec 2025 13:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766410415; cv=none; b=fFPWkI8Yctg7jwSRANW0HyE9yqpfkBo486zwm1DsTPxk7HwLXR8gHmCRKhYZOdjVkROK7JXrtF+fXgEUOPypbqxcVgjkiauvAKQgWz0GiC5TBHZXTEf2/aoAQ98x5XXqK5GN0LcIBK+1q78z8rl/SD7H0GoWYu96ufSU5It6Heg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766410415; c=relaxed/simple;
	bh=//2OviAI1/3/liN4S3vRbqC1xxmvB6aX8gUtDT4F5X8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=B9Sjrxf7HkMOpeYS+27GJKLHS04Ch0u0SJq9F/pTutlL8w/9jimlA9SHO8PKXsXbnh31IyXY2P/pTMkEbZK3o6p+fEhPiDZYhmFr0xzcC13t/l/A2vQc1CRYq4lfz9oLLjye/GloSNfVMaXn7sDu/A7QWP316sZNMXvIzX6T8lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paxsudos.fi; spf=pass smtp.mailfrom=paxsudos.fi; arc=none smtp.client-ip=62.142.5.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paxsudos.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paxsudos.fi
Received: from mail.lja.fi (80-186-162-127.elisa-mobile.fi [80.186.162.127])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTPSA
	id 9c384b07-df3a-11f0-9850-005056bdd08f;
	Mon, 22 Dec 2025 15:32:07 +0200 (EET)
Received: by mail.lja.fi (Postfix, from userid 120)
	id EC631156F9590; Mon, 22 Dec 2025 15:32:06 +0200 (EET)
X-Spam-Level: 
Received: from [10.202.212.169] (unknown [83.245.227.85])
	by mail.lja.fi (Postfix) with ESMTPSA id 2377F156F957D;
	Mon, 22 Dec 2025 15:31:53 +0200 (EET)
Message-ID: <22035087-9a3f-4abb-8851-9c66e835b777@paxsudos.fi>
Date: Mon, 22 Dec 2025 15:31:48 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] Secure TCP (STCP): Rust-based encrypted transport protocol
 for kernel integration
From: "Lauri Jakku, CEO Of Paxsudos IT" <lauri.jakku@paxsudos.fi>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: rust-for-linux@vger.kernel.org
References: <73757a9a-5f03-401f-b529-65c2ab6bcc13@paxsudos.fi>
 <CANiq72mE5x70dg_pvM-n3oYY0w2mWJixxmpmrjuf_4cv2Xg8OQ@mail.gmail.com>
 <ac4c2d81-b1fd-4f8f-8ad4-e5083ebc2deb@paxsudos.fi>
In-Reply-To: <ac4c2d81-b1fd-4f8f-8ad4-e5083ebc2deb@paxsudos.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Copyrighted-Material: https://paxsudos.com/

Hi,

   Now i've cleaned the code from warnings, the code now is at:

https://github.com/MiesSuomesta/STCP/tree/main/kernel/OOT/linux


   The STCP module is brand new addition to kernel, and it upgrades any 
ordinary TCP connection to very secure TCP

   connection, just by a protocol number change from IPPROTO_TCP to 
IPPROTO_STCP.


   I've done it for userspace also, but I tought that kernel module is 
more practical and the effort to use the encrypted

   TCP would be minimal, just a change the socket creation from TCP => STCP.


   Next: I'll create patch for submission ..

--Lauri Jakku / Paxsudos IT


Lauri Jakku, CEO Of Paxsudos IT kirjoitti 12.11.2025 klo 6.04:
> Hi,
>
>   Nice, I'll do just that then. I'll clean up the code for patch 
> submission.
>
> --Lauri
>
> Miguel Ojeda kirjoitti 11.11.2025 klo 23.25:
>> On Mon, Nov 10, 2025 at 11:27 PM Lauri Jakku, CEO Of Paxsudos IT
>> <lauri.jakku@paxsudos.fi> wrote:
>>> I would appreciate feedback from the Rust-for-Linux and netdev
>>> communities on integration strategy and long-term direction.
>> Sounds good -- I would suggest Cc'ing netdev, since they are the ones
>> that will decide if they want this. I would also suggest Cc'ing the
>> relevant maintainers directly, not just the list.
>>
>> In general, as Greg said, you will likely want to have at least
>> patches for a prototype that can be applied upstream, i.e. to the
>> mainline kernel.
>>
>> Cheers,
>> Miguel
>> .---<[ Paxsudos IT / Security Screening 
>> ]>---------------------------------------------------------------->
>> | Known viruses: 8708713
>> | Engine version: 1.4.3
>> | Scanned directories: 0
>> | Scanned files: 1
>> | Infected files: 0
>> | Data scanned: 0.00 MB
>> | Data read: 0.00 MB (ratio 1.00:1)
>> | Time: 18.996 sec (0 m 18 s)
>> | Start Date: 2025:11:11 22:26:09
>> | End Date:   2025:11:11 22:26:28
>> | SPAM hints: []
>> | SPAM hints: []
>> | Message not from DMARC.
>> `-------------------------------------------------------------------->
.---<[ Paxsudos IT / Security Screening ]>---------------------------------------------------------------->
| Known viruses: 3626996
| Engine version: 1.4.3
| Scanned directories: 0
| Scanned files: 1
| Infected files: 0
| Data scanned: 0.00 MB
| Data read: 0.00 MB (ratio 0.00:1)
| Time: 12.238 sec (0 m 12 s)
| Start Date: 2025:12:22 15:31:53
| End Date:   2025:12:22 15:32:05
| SPAM hints: []
| SPAM hints: []
| Message not from DMARC.
`-------------------------------------------------------------------->
