Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C662F486423;
	Mon, 12 Oct 2026 12:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791807840; cv=none; b=fl0/rMDB5CE1lEEHfdmcUxcYIJ1Wb+jLzMytZIJJXNsN0Nyf7g5Tgv48JfFIJjc+bulHKHa2RwEzlQ8W2/pAa44ITY405w+4bVL5SZBvZfa/eIWoJHn7EXUyMm1U9JoN3bzd78S7nfz7cCHdi29YO0FtLJl7FZSvR+KR+0ZAgqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791807840; c=relaxed/simple;
	bh=wy9Gx+N/9S1JDwhcoZEbyNCZkKNsAOAUmmRjdUAAMV4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LNafBSifsMJp1sxltySKz4c4D59iOsC1VSMpoH+cH9UbeXPFGzJ72sWrgqweKaz3Do4QEVJIDfJeiqfKRrBdBkcwErJSaCfNiQikDciesfewmwjc03UeZozXjYgP13QRMCt8AWzr1Q91wjH9TY/2SU2HjwFspHXg7H9E4GtVutw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yLEPUquB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FYvAa7Jx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yLEPUquB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FYvAa7Jx; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yLEPUquB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FYvAa7Jx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yLEPUquB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FYvAa7Jx"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CCADA1F7B6;
	Mon, 12 Oct 2026 12:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791807836; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=do7J0AtXisbauE+W5p3gF+8pETJEin+2Aakr3SiTWQQ=;
	b=yLEPUquBvLevShf4PrvZQPt4psHAPdlG8/Qps8ynDIBlYxWRkOqDdASPqect7jtIvHMswN
	qdupi6yYg2HCVGpOTlGJjke7f8CHonm7g+7b5ZxMlYXTvkOSnba8ViHq6TNIX7ThAog5dZ
	PQ1aX73a+ddyEGCaqj1lGJN02bdSNhY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791807836;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=do7J0AtXisbauE+W5p3gF+8pETJEin+2Aakr3SiTWQQ=;
	b=FYvAa7Jxcfd3YVu1A/CFlb+IuJtR0MohZYWL9Q+SBnng357FXJq89s/upt9H5fKrK6VVWt
	S6ujFZYRzdf3xCDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791807836; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=do7J0AtXisbauE+W5p3gF+8pETJEin+2Aakr3SiTWQQ=;
	b=yLEPUquBvLevShf4PrvZQPt4psHAPdlG8/Qps8ynDIBlYxWRkOqDdASPqect7jtIvHMswN
	qdupi6yYg2HCVGpOTlGJjke7f8CHonm7g+7b5ZxMlYXTvkOSnba8ViHq6TNIX7ThAog5dZ
	PQ1aX73a+ddyEGCaqj1lGJN02bdSNhY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791807836;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=do7J0AtXisbauE+W5p3gF+8pETJEin+2Aakr3SiTWQQ=;
	b=FYvAa7Jxcfd3YVu1A/CFlb+IuJtR0MohZYWL9Q+SBnng357FXJq89s/upt9H5fKrK6VVWt
	S6ujFZYRzdf3xCDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 80D7B13314;
	Mon, 12 Oct 2026 12:23:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DjQFE1zRzGolKQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 12 Oct 2026 12:23:56 +0000
Date: Mon, 12 Oct 2026 14:23:55 +0200
Message-ID: <87ld83gl9g.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Tristan de Cacqueray <tristan@midirus.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Miguel Ojeda <ojeda@kernel.org>,
	linux-sound@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 0/3] rust: snd: Introduce experimental ALSA rawmidi abstractions
In-Reply-To: <20261011-rust-snd-v1-0-7974ecdcd345@midirus.com>
References: <20261011-rust-snd-v1-0-7974ecdcd345@midirus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO

On Sun, 11 Oct 2026 15:02:11 +0200,
Tristan de Cacqueray wrote:
> 
> Hi Takashi and the Rust for Linux maintainers.
> 
> I just noticed your mail about an early Rust prototype for the sound
> subsystem right before I was about to submit this RFC!
>   https://lore.kernel.org/alsa-devel/878q48579z.wl-tiwai@suse.de/
> 
> Nevertheless, please allow me to share what I had in mind through this
> small proof of concept for the `rawmidi` API. I am looking for feedback on
> the scope, coordination, and the ownership model rather than a detailed
> review for merging.
> 
> My use case is a new hardware controller using a custom serial protocol.
> While developing its Rust driver, I needed an interface to ALSA rawmidi.
> I'm particularly interested in handling rawmidi substream safely to avoid
> issues like the one fixed by
>   221253723dc5 ("ALSA: bcd2000: Fix race between rawmidi and disconnect")
> 
> So, I wrote some bindings to see how that would look like. This series adds
> experimental snd_card and snd_rawmidi wrappers, input/output callback
> traits, and a sample rawmidi faux device using delayed work to simulate
> incoming MIDI data.
> 
> This is not merge-ready. In particular, the prototype does not yet enforce
> the devres lifetime of the card or the lifetime of its rawmidi wrapper. The
> substream helper also relies on the driver clearing it before close
> returns.
> 
> Here are my questions:
> 
>   1. Does this rawmidi experiment overlaps with your prototype?
>      If so, I would be happy to coordinate or adapt this experiment to it.

No, my patchset doesn't contain rawmidi support yet.
The sound card abstraction would conflict quite, sure, but it wouldn't
be too hard to adapt, I guess.

>   2. Is rawmidi a useful initial target for ALSA Rust abstraction?

Sure, why not, if it's actually needed? :)

>   3. Does your prototype mirror the C API 1:1, or for example, does it hide
>      the substream lifecycle? That's the design choice I'm least sure about.

It's mostly a straightforward wrapping of C API, but there are a few
twists to adapt Rust-way.  The card can be managed in RAII style, too,
for example.

I haven't prepared for submission, but you can find the current
changes in test/sound-rust branch of sound git tree (either kernel.org
or github.com):
  https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/log/?h=test/sound-rust
  https://github.com/tiwai/sound/tree/test/sound-rust
  
Those are over 50 commits on top of 7.3-rc5, and I'll likely rebase a
bit to rearrange before submission, so beware of changes in future.

The commits begin with a few Rust kernel changes for fixing and
addition for the sound support, including the PM support from Beata
Michalska (just took what have been posted), followed by ALSA core
abstractions for the card, PCM and controls.

Then it continues to the implementations of 3 actual sound drivers for
PCM/control: the dummy driver (with platform and hrtimer), and the
ens1370 and intel8x0 drivers for PCI devices to be run on VM.

After that, the extension to USB abstraction follows, including the
isochronous support patches by Colin Braun, and then the USB-audio
driver implementation (that can run on an actual bare metal), as well
as the USB runtime PM support.


BTW, until now, I haven't planned for any serious consideration to
merge Rust stuff yet.  Partly because the above was a pure experiment
for me, but another big obstacle is that the whole Rust C binding is
limited to built-in vmlinux.  With a distribution kernel maintainer
hat on, this is absolutely NO-GO -- we really want to avoid built-in.
(Graphics is a kind of exception nowadays because of boot support,
though.)  Can this be worked out soon...?


thanks,

Takashi
