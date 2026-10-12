Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37ED4E06E2;
	Mon, 12 Oct 2026 19:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791834391; cv=none; b=ChCfgeLqPY85I+3tyKWFxctZkmis5lEHpdxp5CKgwnqvjx2Qll5/GmC/gMkJUqQDRRA5ngKrlQYfz9lZjR+uHl7vgXEiIBhupsJdXDqU7pMB4Lpdb/e9DmbsocQTHhVnFPHKC2MgzgkrF0f6+/GyydVU8ZGepZioRMhCgj85P10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791834391; c=relaxed/simple;
	bh=SN53F77NdYCtAEJZRRSye0TNxqG5SZP+TUKigpp+ovg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jn5QxHIDb+IQUSuyWTJryoLIE1fwDL3vkBN33g71pDdsUysMOW1eANruOKe3Kqzj+aC7eOCG9UdFg9s7bnAe0TVCfnpLWtVefPoHDbyrH59suWmssePWBNTmeHl2cuX/joGSv2akirp7BoJ6GN0NIHSaxfyTKWrqBGIU6DBb3Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=midirus.com; spf=pass smtp.mailfrom=midirus.com; dkim=pass (2048-bit key) header.d=midirus.com header.i=@midirus.com header.b=uZIdrEW9; arc=none smtp.client-ip=185.70.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=midirus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=midirus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=midirus.com header.i=@midirus.com header.b="uZIdrEW9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=midirus.com;
	s=protonmail; t=1791834377; x=1792093577;
	bh=7eUeVZarUBPNmnvtSEi9wLI7Tja8/hA2NLZl7ky89hg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=uZIdrEW9/NrOscsimbd7pG+xUT2o7srorJk7pgFnRU86hHCZu/x02wMEPTT5Vr4KZ
	 WmwE3JhfQctmCTaYcUBg0CgODbbGi4fPb/oC9qibI7e+9vrD7yaZHgdEhZswWsePzv
	 dhgM/mrY2o27M+rpKVWZTFCMwGGf/Hf+giErG7kxHjUvzyAVH5asEBeKtulP4knObu
	 ujEcxTjB8CnWTW1Dz+un1ECzhGh4Pfi093im+VeYl+FxlxpdWKY/VJ99esjbBILPr7
	 +wdJEWTJ8YXcQSYrsXvvD9D1MD45lDGlQD8YKAfFDTrR7A9hDst0cN9asJ03mWd2bM
	 mFsML3WdRRRlA==
Date: Mon, 12 Oct 2026 19:46:11 +0000
To: Takashi Iwai <tiwai@suse.de>
From: Tristan de Cacqueray <tristan@midirus.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, linux-sound@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 0/3] rust: snd: Introduce experimental ALSA rawmidi abstractions
Message-ID: <87ik36em81.fsf@midirus.com>
In-Reply-To: <87ld83gl9g.wl-tiwai@suse.de>
References: <20261011-rust-snd-v1-0-7974ecdcd345@midirus.com> <87ld83gl9g.wl-tiwai@suse.de>
Feedback-ID: 135030709:user:proton
X-Pm-Message-ID: 7553b34d4b22bd294f68b24f3dd9bb1a0aaae7e5
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Mon, Oct 12, 2026 at 14:23 Takashi Iwai wrote:
> On Sun, 11 Oct 2026 15:02:11 +0200,
> Tristan de Cacqueray wrote:
>>
>> Hi Takashi and the Rust for Linux maintainers.
>>
>> I just noticed your mail about an early Rust prototype for the sound
>> subsystem right before I was about to submit this RFC!
>>   https://lore.kernel.org/alsa-devel/878q48579z.wl-tiwai@suse.de/
>>
>> Nevertheless, please allow me to share what I had in mind through this
>> small proof of concept for the `rawmidi` API. I am looking for feedback =
on
>> the scope, coordination, and the ownership model rather than a detailed
>> review for merging.
>>
>> My use case is a new hardware controller using a custom serial protocol.
>> While developing its Rust driver, I needed an interface to ALSA rawmidi.
>> I'm particularly interested in handling rawmidi substream safely to avoi=
d
>> issues like the one fixed by
>>   221253723dc5 ("ALSA: bcd2000: Fix race between rawmidi and disconnect"=
)
>>
>> So, I wrote some bindings to see how that would look like. This series a=
dds
>> experimental snd_card and snd_rawmidi wrappers, input/output callback
>> traits, and a sample rawmidi faux device using delayed work to simulate
>> incoming MIDI data.
>>
>> This is not merge-ready. In particular, the prototype does not yet enfor=
ce
>> the devres lifetime of the card or the lifetime of its rawmidi wrapper. =
The
>> substream helper also relies on the driver clearing it before close
>> returns.
>>
>> Here are my questions:
>>
>>   1. Does this rawmidi experiment overlaps with your prototype?
>>      If so, I would be happy to coordinate or adapt this experiment to i=
t.
>
> No, my patchset doesn't contain rawmidi support yet.
> The sound card abstraction would conflict quite, sure, but it wouldn't
> be too hard to adapt, I guess.
>

That's great, I can rebase my rawmidi abstraction onto your branch.

>>   2. Is rawmidi a useful initial target for ALSA Rust abstraction?
>
> Sure, why not, if it's actually needed? :)
>

I think Rust could help make midi_ops implementation safer. Would it make
sense to port the virmidi driver as a demonstration, or would you
recommend a different driver as a starting point?

>>   3. Does your prototype mirror the C API 1:1, or for example, does it h=
ide
>>      the substream lifecycle? That's the design choice I'm least sure ab=
out.
>
> It's mostly a straightforward wrapping of C API, but there are a few
> twists to adapt Rust-way.  The card can be managed in RAII style, too,
> for example.
>
> I haven't prepared for submission, but you can find the current
> changes in test/sound-rust branch of sound git tree (either kernel.org
> or github.com):
>   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/log/?h=
=3Dtest/sound-rust
>   https://github.com/tiwai/sound/tree/test/sound-rust
>
> Those are over 50 commits on top of 7.3-rc5, and I'll likely rebase a
> bit to rearrange before submission, so beware of changes in future.
>
> The commits begin with a few Rust kernel changes for fixing and
> addition for the sound support, including the PM support from Beata
> Michalska (just took what have been posted), followed by ALSA core
> abstractions for the card, PCM and controls.
>
> Then it continues to the implementations of 3 actual sound drivers for
> PCM/control: the dummy driver (with platform and hrtimer), and the
> ens1370 and intel8x0 drivers for PCI devices to be run on VM.
>
> After that, the extension to USB abstraction follows, including the
> isochronous support patches by Colin Braun, and then the USB-audio
> driver implementation (that can run on an actual bare metal), as well
> as the USB runtime PM support.
>

Thank you for sharing the branch. I'll take a look.

>
> BTW, until now, I haven't planned for any serious consideration to
> merge Rust stuff yet.  Partly because the above was a pure experiment
> for me, but another big obstacle is that the whole Rust C binding is
> limited to built-in vmlinux.  With a distribution kernel maintainer
> hat on, this is absolutely NO-GO -- we really want to avoid built-in.
> (Graphics is a kind of exception nowadays because of boot support,
> though.)  Can this be worked out soon...?
>

Wow, that sounds like a major limitation that I wasn't aware of. I'm not
familiar with the status of this issue, but I'd be happy to help if
there's something I can contribute.

Thank you for the prompt reply Takashi. I really appreciate it!
-Tristan

