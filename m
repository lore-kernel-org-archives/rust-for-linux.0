Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4E82054EF
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Apr 2025 07:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.63.210.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744269141; cv=none; b=Oz3daIDc3De/GEVR3yph4AxTPzMw6nrBE3VKg3R8KvNTNizl2fXKnL76ghI9j3fVwBkEWw82CUAZ+jD6cGBXRC86ChEEgCsN/hZNDnJ66DF0TKa7m8PxTt76x161G4YFfDJJaJ891iwx0yfMkWIil1Wj+ETQX4LB4QVZhnVP1Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744269141; c=relaxed/simple;
	bh=A0fatj+M1zOIsMnCl7oy4zS6v/YQ8BRCrnVYAjIXyfI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=WxG+DDCf30iikcOe889Qq4NAG2pCBk6xFgZxaBYV9Huh8zoWk2GizgBQN/DDJUDC8dqwWrRtAx6y+ifs2/0793EsoKqUav5E/fRp3+WSYScSRnAgxHtauaD6VCaCDc+Htd2wLZD+Uh9en4ZShU9Vn3P5hUrrqsbGQ8ki+eer1rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net; spf=pass smtp.mailfrom=asahilina.net; dkim=temperror (0-bit key) header.d=asahilina.net header.i=@asahilina.net header.b=XTp9tvRB; arc=none smtp.client-ip=212.63.210.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asahilina.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=asahilina.net header.i=@asahilina.net header.b="XTp9tvRB"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: lina@asahilina.net)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 9C72742755;
	Thu, 10 Apr 2025 07:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1744269136;
	bh=A0fatj+M1zOIsMnCl7oy4zS6v/YQ8BRCrnVYAjIXyfI=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=XTp9tvRBxV8d3G2JulrQkctSRqEBw1BjnMWXb1Hwvs0EQWgowgIsNoscKl4dhaGeO
	 2s+XafM7E3Q2pTwtv9XZvxDqxsy4Mp3RmuT2wPOZ8OT3ad4rLac2YSFTjKPmJASJWs
	 SE7eHSLbWhbwFwc599oVta9autYRbckFYsbN/OBoHkafId/k0rH5Ku8sHnlwJY5Yr+
	 41uowX1v8L6jV7PVbyX1VC2kWB6B+KXrzQXHlZkwWHLMCcw/h9nCRdQCKugRL/mB+4
	 t62mdzI0/VDZrO1k9A3w/LjPZn7pHobxVsrWHrjlSI5cSiF3vOaAIH2xU8yga/M3eo
	 VbFLBapbaEcxw==
Message-ID: <43ec8aba-f279-422d-95d1-68daac7eaed9@asahilina.net>
Date: Thu, 10 Apr 2025 16:12:13 +0900
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] DRM Rust abstractions
From: Asahi Lina <lina@asahilina.net>
To: Dave Airlie <airlied@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, lyude@redhat.com,
 acurrid@nvidia.com, daniel.almeida@collabora.com, j@jannau.net,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 rust-for-linux@vger.kernel.org
References: <20250325235522.3992-1-dakr@kernel.org>
 <32e7da7e-de32-4bc6-a751-f604da36a63f@asahilina.net>
 <Z_VXBZcBsk2k6eVN@cassiopeiae>
 <143206f6-cd97-4ef8-a4f3-f68d703903bf@asahilina.net>
 <Z_V2ZxIZxI_HiHM5@cassiopeiae>
 <ebbb4d4e-4778-434b-82d7-188f8f6152ff@asahilina.net>
 <CAPM=9ty5dNQOJUj=wtubGYGt5Kt3QeQAQ9rjM2P0dwjBUFspMw@mail.gmail.com>
 <34a4a130-98d1-4cc3-8dcf-b72b3ed36c10@asahilina.net>
Content-Language: en-US
In-Reply-To: <34a4a130-98d1-4cc3-8dcf-b72b3ed36c10@asahilina.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/10/25 1:33 PM, Asahi Lina wrote:
> 
> 
> On 4/10/25 6:29 AM, Dave Airlie wrote:
>> On Wed, 9 Apr 2025 at 17:49, Asahi Lina <lina@asahilina.net> wrote:
>>>
>>>
>>>
>>> On 4/9/25 4:17 AM, Danilo Krummrich wrote:
>>>> On Wed, Apr 09, 2025 at 03:06:38AM +0900, Asahi Lina wrote:
>>>>> On 4/9/25 2:04 AM, Danilo Krummrich wrote:
>>>>>> On Wed, Apr 09, 2025 at 01:29:35AM +0900, Asahi Lina wrote:
>>>>>>> On 3/26/25 8:54 AM, Danilo Krummrich wrote:
>>>>>>
>>>>>> You said "use it/submit it in any way".
>>>>>
>>>>> I thought keeping authorship is an implied part of kernel etiquette.
>>>>> Usually when you submit code someone else wrote, you keep them as
>>>>> primary author... I want you and others to use the code, that doesn't
>>>>> mean I want you to put your name on it as if you wrote most of it.
>>>>
>>>> The broader context of the private mail was about you stepping back on kernel
>>>> development. You did so with a few more details (which I'm not going to
>>>> disclose), that made it clear to me that you don't want to be bothered with
>>>> kernel development any more.
>>>>
>>>> In combination with you giving permission to "use it/submit it in any way", I
>>>> thought it's better to just pick a safe path to not misrepresent you given all
>>>> the changes I made.
>>>>
>>>> I do still credit you on all corresponding patches though.
>>>>
>>>>>>> I'm really tired of kernel politics and I don't want to spend more brain
>>>>>>> cycles looking at all the other patches or having to argue (in fact I
>>>>>>> usually don't look at patch emails at all recently), but I would
>>>>>>> appreciate if you keep my authorship for files that I did largely author
>>>>>>> myself. After everything I've been going through the past weeks (some of
>>>>>>> the people on Cc know what that's about...) this feels like yet another
>>>>>>> slap in the face.
>>>>>>
>>>>>> As mentioned, please diff the correct thing and then just tell me where you'd
>>>>>> like to have primary authorship changed.
>>>>>
>>>>> I don't even know what tree this series is supposed to apply onto (tried
>>>>> drm-misc next, torvalds/master, v6.15-rc1) so I'm just going to take
>>>>> drm-misc/topic/rust-drm and assume that's what this series includes.
>>>>>
>>>>> $ diff -urN rust/kernel/drm/drv.rs ../uplinux/rust/kernel/drm/driver.rs
>>>>> | grep '^+' | wc -l
>>>>> 45
>>>>>
>>>>> So I'm diffing the correct thing now and the result is essentially
>>>>> identical.
>>>>>
>>>>> Meanwhile, device.rs has many additions... but a big chunk of those is
>>>>> code that was just moved from drv.rs (like drm_legacy_fields and the
>>>>> code that uses it).
>>>>
>>>> Except drm_legacy_fields! and VTABLE (which is just trival boilerplate code)
>>>> device.rs changed fundamentally, i.e. I switched the device abstraction to use
>>>> the subclassing pattern.
>>>>
>>>> If you look further you will find that I really changed a lot of things.
>>>>
>>>> I have *nothing* to hide, here's the overall diff for all the changes I made:
>>>>
>>>>       [1] https://pastebin.com/FT4tNn5d
>>>>
>>>>>
>>>>> Again, I don't have the spoons to make some deep analysis here, you
>>>>> should know how much of the code you changed, added, or just moved
>>>>> around. I'm not going to litigate this further. If you think splitting
>>>>> up a commit into multiple commits and moving code around warrants taking
>>>>> over primary authorship of a project I've been working on for years now,
>>>>> so be it.
>>>>
>>>> You just said you "don't have the spoons to make some deep analysis here" and
>>>> right below you acuse me of just "moving code around".
>>>>
>>>> Which means that you do so *without* evidence. And again, I have *nothing* to
>>>> hide, see [1].
>>>>
>>>> Besides that I also told you that I'm fine to change primary authership, if you
>>>> tell me where you think it would be appropriate (even though I do think my
>>>> changes do justify how things are currently).
>>>>
>>>>> I'm just disappointed.
>>>>
>>>> That's where you are maneuvering *yourself* into.
>>>>
>>>> You could have easily just asked me to change things for patch #X, #Y and #Z.
>>>>
>>>> Instead you outright started with accusing me of things. I also feel like you
>>>> intentionally try to misrepresent what I am doing and what my intentions are.
>>>>
>>>> I neither have the time, nor am I willing to deal with random drama like this.
>>>>
>>>> If you want something changed, just go ahead and tell me what, *without* more
>>>> drama and without more accusing me of things.
>>>>
>>>
>>> Alright, then please remove my authorship entirely from this series,
>>> including Co-developed-by and signoff lines. I hereby release my code as
>>> CC-0, which means you don't need the signoffs, it's yours now. The same
>>> applies to any future code submitted that I originally authored as part
>>> of the Asahi kernel git tree. That way we don't need to argue about any
>>> of this.
>>>
>>> I thought asking for patches that I mostly authored to keep my Git
>>> authorship would be an uncontroversial request (and not unreasonable to
>>> ask you to figure out which those are, since you made the
>>> changes/splits, and #3 clearly is one), but apparently even that gets
>>> you flamed on Linux threads these days.
>>>
>>> I regret having been part of this community.
>>
>> Look, this isn't Crank or Speed, there is no need to keep the drama
>> level above 50 to sort this out.
>>
>> This also isn't exactly how best to relicense code, so I think we
>> should abstain from doing anything to help promote more drama.
>>
>> The project will maintain authorship/signoffs on any patches that are
>> clearly still authored by you, we will err on the side of caution and
>> on rewritten patches which share some decent amount of history shall
>> retain your authorship. In this case it does appear instead of putting
>> in the 5 minutes of looking at Danilo's reasoning and supplied diff,
>> and either saying "my bad, this is sufficiently new code and I don't
>> feel I wrote it" or "I'd still prefer to retain authorship despite
>> your changes", both of which Danilo indicated would be respected you
>> somehow picked door number 3 which probably took more time and effort
>> than either of the above options. Again no need to pick door number 3
>> here, you can let the bus go below 50, it won't explode.
>>
>> Dave.
>>
> 
> I wanted to keep this private, but apparently it is impossible for me to
> send two emails in reply to a Linux kernel thread without it ending up
> all over the news and the entire world speculating about why I am so upset.
> 
> I would be a lot more willing to work with the kernel community if I
> hadn't been traumatized by a major Linux kernel maintainer having
> privately admitted to siding with an abuser and harasser who has
> attacked me relentlessly for over one year now, mocking me for it, using
> their arguments and wording against me, lying to their peers to cover up
> actions and collusion against me, and more.
> 
> Now please, let me leave this community in peace. You all figure out
> what to do with my code and whether you care about proper attribution. I
> just want out.
> 
> ~~ Lina
> 

P.S. my analysis based on the pasted code (since everyone here and
everyone on Reddit is forcing me to do it) is that:

The series adds around 978 lines of code. After merging some code that
was just moved around in the diff that Danilo posted, only 412 addition
lines remain in the diff. So more than 50% of the raw remaining code is
mine. If you exclude comments, Danilo only added 270 lines of actual
code (and whitespace). And of those, a good portion were just minor
changes and refactoring, not completely novel code (this also tracks
with the stat that to get to those 270 lines, 379 were removed, and much
of those probably pair up as minor refactorings and not outright novel
code).

In terms of actual code added an not just lines rearranged or further
commented, I probably wrote at least 75% of this series. And I'm sure
Danilo knows this, having done the refactoring/rearranging/modification
work to get here.

Danilo: If you do not take me up on the CC-0 offer, I expect you to put
my name as primary author of patches 3 through 7.

~~ Lina

