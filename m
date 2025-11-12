Received: from fgw23-4.mail.saunalahti.fi (fgw23-4.mail.saunalahti.fi [62.142.5.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A687DDAB
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 04:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762920361; cv=none; b=pR+bo0e5f8ChGR8CKbHc0tXGhyZ0xVO4wrIGy8KdO6ttcsb+70BMU+59A1V190KpezP0ceb2wFABr2RyYo6M3Ioyrs5JKFIVjUSyIppFCIPOKPcWEFUKZYwFrkd7GDVAmGCNFg1eLUx9X+Osw0n2+V7APFHlnK9vhrBeDHJg4N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762920361; c=relaxed/simple;
	bh=PajlAHEehSME8j1RmTFUiVLIotUFaa7B6XRXKZiTUA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UeAIKANrrxtAuci6haPL83vswLjbBFY6Gi0aXb3yeuQHDOqSzIFeB2Hfj9JnFamwr29//VfLF3n/AeW4SMsfwvx6kt6Us9vglGy6Z4FTg492bTghF17zXGuAYI9ayu0+XJIks1f5kSoXB3nOKw79f+fRazMoyx5YIpJsqPId91o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paxsudos.fi; spf=pass smtp.mailfrom=paxsudos.fi; arc=none smtp.client-ip=62.142.5.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paxsudos.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paxsudos.fi
Received: from mail.lja.fi (80-186-162-127.elisa-mobile.fi [80.186.162.127])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTPSA
	id b963b1ea-bf7c-11f0-a2cf-005056bd6ce9;
	Wed, 12 Nov 2025 06:04:45 +0200 (EET)
Received: by mail.lja.fi (Postfix, from userid 120)
	id 6426614A73ADC; Wed, 12 Nov 2025 06:04:45 +0200 (EET)
X-Spam-Level: 
Received: from [192.168.1.186] (kytkin.sokeavartija.org [192.168.1.1])
	by mail.lja.fi (Postfix) with ESMTPSA id D9D5F14A73AD2;
	Wed, 12 Nov 2025 06:04:13 +0200 (EET)
Message-ID: <ac4c2d81-b1fd-4f8f-8ad4-e5083ebc2deb@paxsudos.fi>
Date: Wed, 12 Nov 2025 07:04:13 +0300
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] Secure TCP (STCP): Rust-based encrypted transport protocol
 for kernel integration
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: rust-for-linux@vger.kernel.org
References: <73757a9a-5f03-401f-b529-65c2ab6bcc13@paxsudos.fi>
 <CANiq72mE5x70dg_pvM-n3oYY0w2mWJixxmpmrjuf_4cv2Xg8OQ@mail.gmail.com>
Content-Language: en-US
From: "Lauri Jakku, CEO Of Paxsudos IT" <lauri.jakku@paxsudos.fi>
Autocrypt: addr=lauri.jakku@paxsudos.fi; keydata=
 xsDNBF+gRGsBDACuxCArlsQxA+ARmCMIBSC0Aqw0J3mCCxeI6OjWQqGQQ69pDiEp8jVjn9s4
 fG9I0hAnYVbOSsvnCDvPf5SmFACUdG3Y7N1cJwKuoL53g1llVGxddzK3LIAmfUI/YbnvVE9s
 iDtPp7XJGnJsmRhskUPBp0H4sHORA4XvliKwH4oRJx3Z4BN0dgyzEWPtSG2AXKQPGncRe9MB
 o3BZuEAjOeFVemv0WIk1Y17YpeoX84LNa/vA4c3aWZyYI5uT6AJsaO1hcKKyS+s706xbpJf+
 pfsLFoSDvgeWdNGOaDAYthzckOnBZtMAFBFWBLZi62I6YxdjEP19aayo/HeXqJuK+6lg0k+w
 yE/y07p3e9RoNOllv1zFDDaCLEaAHmGi6xMgLkFOmPvNvwhgBsMa7XFLy1SfPwiDAuFLm0gG
 Perl5gZXxqnfYht3cH+uoVlJWfb1JcnoC3GKBR6DKqOr50YvWo4g6g/fEy5hWmxTaoML3x7B
 016qO8eFCogT9AImfvdR5QUAEQEAAc0lTGF1cmkgSmFra3UgPGxhdXJpLmpha2t1QHBheHN1
 ZG9zLmZpPsLBCQQTAQgAMxYhBOSki0v6qconSHwMdYwThjaDp4dFBQJfoR+bAhsDBQsJCAcC
 BhUICQoLAgUWAgMBAAAKCRCME4Y2g6eHRVhbC/4uH9hdGFwyFgHrvjEF7m/W0ewIhP2ub7Z+
 lGpIiA7Ym5Oe/T7+PcjwraIyiYBWvLl3qd04MNkcthzkS3esb+2xSjEFLcQ8DyM7AEz0aa5g
 aHNZiP+qNEUoD0MgiU4y9M2DRt8Kk+c42ZnDHLMVsG+6DjCN5oH48nn+R8aK+pMmIYZqFJHN
 T389CJ1zCyxRMppNKG2rII/HL6LyzuDmJXEXDlBA0okrNkpD/2CzLnVwhqOKSqcV0mAxO0Fh
 4baY5m64JoLa7caOFx7bkaNVa41jZuRSPRXLQ1SQPVyO+UWs5OFpXCYJE9ATDPENfm+8ZIt+
 4Tr+qUCgst+AO1aM/Tw/XKBX6MdJqEnWXNMefgAu51IkVmbJQ2ue8akZqquqBNBlqs3x8h7p
 ko4yqCYu1b+MSLE8ts3CLPw9g1/heR0voP/BdJLuOAeZPbK2CGjGT1vETTkrA9U65RAH3/3T
 GQOu9prbPNFzv+GTX2fmBntZK0ON1m8/I0sW1YWs8jG+v0rOwM0EX6BEbQEMAM0fQCoJCQZ4
 3BhjEJJ/mKrlyeU4PunVYxGRQnyvznEdqHzBE8q51rvFQly/SqRApy2+BY57XDDIW3mcz8kz
 lzruUdxa1eUhML+xPRAeTZ3a6R1m41uy5jjDwgaILFHLGRPZpwrkHC0j7Z6psHwWfK9SxiW1
 Hv7B6DoYsE89SQHG8+NlG17lYDl0a4j+BGLcRrcZHQnDYjTgJjVRhpx8mwsqOGHHlcEeca7k
 YWGT/EMIura/AoRdPqRA/VEnVXmHVno18zIYbbrut0qQ9PBi2d4fjjNLVPPNw0fIfMMtob+d
 dq066Zr3BGYh2hX8DyedA+eR4NZlDPFqlamgdBQN5XDXP/CjVGx8kHfwUOVMf1POxDKd5GRt
 B47wjdPF7CRNgbbVuUutsszgG204U814OIs+lpyuRYXTzX9i2dTi4HzqGQTwp/1ssPUqm0gV
 J2g8Gr/PwRn4+ilhCktPoi5rBhyq7lmhM7IMCA0n/+ULekz3caOz1RC4QYSp1O07FhnofQAR
 AQABwsD2BBgBCAAgFiEE5KSLS/qpyidIfAx1jBOGNoOnh0UFAl+hH5sCGwwACgkQjBOGNoOn
 h0WGJAv8Ccg/HB/vdryAFAtSQ1go3WRf7TOilsYEY7WwxTfhXyUBjxsLy8dTOxMCoYgLGfVX
 yJbvKB6QHP9CKqkGkHL53F09IEoBCOzb5MOqfgBjt3HDfXl3bpiDjXbQw9Z3E9TGQ+aAnwVc
 40EfsEFUqOXOyiWku8GiWOwsv5V7+31rsQayPFOArO9GDz4HdQH9Whyfa8ItO3qQPIM0LhC1
 aYLRVlWNfSp6n+DPV7e2log37bePyhRoMEj1JdTLu9uZmlrOQLh4La/N4j8MezIMArh6+uGQ
 Q7MGpkDPYgDceg6oZyLEA1DnBR4LYCyM+OUZ5qcsOd/LXsEc/2gQGpTp3DCTlZs7XGiX7Wlg
 juPjGC1TPOOZRXPRtu0rw8xHzYlE+yAW7gRVCvFa2vDpenzfoNg6A7Io9Lgf3dWw09WTIMOe
 RKHBw6KCEyAV5kJqbtqYzHr2uW+2CE3Afmfo/gGaN6y4T1EsMNXePB1DL25QTesjet/6dKNo
 t+50SxtAgnYhE9tY
In-Reply-To: <CANiq72mE5x70dg_pvM-n3oYY0w2mWJixxmpmrjuf_4cv2Xg8OQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Copyrighted-Material: https://paxsudos.com/

Hi,

   Nice, I'll do just that then. I'll clean up the code for patch 
submission.

--Lauri

Miguel Ojeda kirjoitti 11.11.2025 klo 23.25:
> On Mon, Nov 10, 2025 at 11:27 PM Lauri Jakku, CEO Of Paxsudos IT
> <lauri.jakku@paxsudos.fi> wrote:
>> I would appreciate feedback from the Rust-for-Linux and netdev
>> communities on integration strategy and long-term direction.
> Sounds good -- I would suggest Cc'ing netdev, since they are the ones
> that will decide if they want this. I would also suggest Cc'ing the
> relevant maintainers directly, not just the list.
>
> In general, as Greg said, you will likely want to have at least
> patches for a prototype that can be applied upstream, i.e. to the
> mainline kernel.
>
> Cheers,
> Miguel
> .---<[ Paxsudos IT / Security Screening ]>---------------------------------------------------------------->
> | Known viruses: 8708713
> | Engine version: 1.4.3
> | Scanned directories: 0
> | Scanned files: 1
> | Infected files: 0
> | Data scanned: 0.00 MB
> | Data read: 0.00 MB (ratio 1.00:1)
> | Time: 18.996 sec (0 m 18 s)
> | Start Date: 2025:11:11 22:26:09
> | End Date:   2025:11:11 22:26:28
> | SPAM hints: []
> | SPAM hints: []
> | Message not from DMARC.
> `-------------------------------------------------------------------->
.---<[ Paxsudos IT / Security Screening ]>---------------------------------------------------------------->
| Known viruses: 8708713
| Engine version: 1.4.3
| Scanned directories: 0
| Scanned files: 1
| Infected files: 0
| Data scanned: 0.00 MB
| Data read: 0.00 MB (ratio 1.00:1)
| Time: 22.838 sec (0 m 22 s)
| Start Date: 2025:11:12 06:04:13
| End Date:   2025:11:12 06:04:36
| SPAM hints: []
| SPAM hints: []
| Message not from DMARC.
`-------------------------------------------------------------------->
