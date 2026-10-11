Received: from mail-106117.protonmail.ch (mail-106117.protonmail.ch [79.135.106.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7794D25B0BE
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Oct 2026 13:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791723745; cv=none; b=gJMtWsN06CFOIxZ38qQ29H+bAvbV/mH/Yd9/cwyEnOsXKlQQ1Cf2+N2GiIngQ+wEHwtUjMOr3bAjFZtIzPVfQGT3r3ROaJ0b9tyH/U21qsLByeyu67gtCOW25vv7oBBdk+YkZ9JSmdOHeNuujXD7iuDx8ykwInh1tPuc98UQNPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791723745; c=relaxed/simple;
	bh=k/jycZjBHU1gGqdmM6zotWObGaNP7sR8ead7LLXgSHU=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hK7rShOzrVWtITd6YCQFHdc90K6kVUmE0PR4voQ2St0u1XlH7vkJXvwP8qQxbe1xTf0BDqPmMegDUl33hB7MGOo3tjyREbHOAvDS5JcqefEsnJPONTc+P9nh73ge3VyNV/FE4SHmWwhAk0otAOmQ/MYlMs/4p/aP5EDuV+LLhiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=midirus.com; spf=pass smtp.mailfrom=midirus.com; dkim=pass (2048-bit key) header.d=midirus.com header.i=@midirus.com header.b=KRjaKOvT; arc=none smtp.client-ip=79.135.106.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=midirus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=midirus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=midirus.com header.i=@midirus.com header.b="KRjaKOvT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=midirus.com;
	s=protonmail; t=1791723736; x=1791982936;
	bh=XwYwgmtGn2W15qgBn6vIQAsIEbv+cAdenFviIA1T9P8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=KRjaKOvT2ceoaONSnZYlvrePYN/IhXhVWiRTe41wNYBS20IeF6zDvQhvuixZ2e44L
	 ymvwzorlEzSxywYBU9OAcy97jz1yBV4TR8KzXfqJmaULkfOjZFSGFdydj6A3EovpPj
	 GuyFV1QRyzftOjaCdbIcOLwXsGjOezXhPN2tlgG3zt6bsuR2b9RzqcdfTfdN0RiLIm
	 kHMEZPUsqcEMxAM1cq1zdBDk3VVsaz7oD20qH0ZBlxf1gJ31F9yyUDOaWYcfobOyUm
	 mZRfHPwUxvnY2UJA46RaAU1MIT9157DBfO2VCtqKudw1EzAnRwfh9gwevZItROLnTt
	 kDPAK36HP5dPw==
Date: Sun, 11 Oct 2026 13:02:11 +0000
To: Takashi Iwai <tiwai@suse.de>, Miguel Ojeda <ojeda@kernel.org>
From: Tristan de Cacqueray <tristan@midirus.com>
Cc: linux-sound@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Tristan de Cacqueray <tristan@midirus.com>
Subject: [PATCH RFC 0/3] rust: snd: Introduce experimental ALSA rawmidi abstractions
Message-ID: <20261011-rust-snd-v1-0-7974ecdcd345@midirus.com>
Feedback-ID: 135030709:user:proton
X-Pm-Message-ID: 93c26f6406d44fb9dfbb4d93a87a99f287b49fed
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Takashi and the Rust for Linux maintainers.

I just noticed your mail about an early Rust prototype for the sound
subsystem right before I was about to submit this RFC!
  https://lore.kernel.org/alsa-devel/878q48579z.wl-tiwai@suse.de/

Nevertheless, please allow me to share what I had in mind through this
small proof of concept for the `rawmidi` API. I am looking for feedback on
the scope, coordination, and the ownership model rather than a detailed
review for merging.

My use case is a new hardware controller using a custom serial protocol.
While developing its Rust driver, I needed an interface to ALSA rawmidi.
I'm particularly interested in handling rawmidi substream safely to avoid
issues like the one fixed by
  221253723dc5 ("ALSA: bcd2000: Fix race between rawmidi and disconnect")

So, I wrote some bindings to see how that would look like. This series adds
experimental snd_card and snd_rawmidi wrappers, input/output callback
traits, and a sample rawmidi faux device using delayed work to simulate
incoming MIDI data.

This is not merge-ready. In particular, the prototype does not yet enforce
the devres lifetime of the card or the lifetime of its rawmidi wrapper. The
substream helper also relies on the driver clearing it before close
returns.

Here are my questions:

  1. Does this rawmidi experiment overlaps with your prototype?
     If so, I would be happy to coordinate or adapt this experiment to it.
  2. Is rawmidi a useful initial target for ALSA Rust abstraction?
  3. Does your prototype mirror the C API 1:1, or for example, does it hide
     the substream lifecycle? That's the design choice I'm least sure about=
.

Testing:
  - build with CONFIG_RUST=3Dy and CONFIG_SAMPLE_RUST_MIDI_DEVICE=3Dm.
  - Run amidi client to receive events from Rust:
      amidi -l # to get the hw number
      amidi -d -S "424344" -p hw:1,0
  - Modprobe/rmmod works, but I haven't reproduced the race between
    rawmidi substream and disconnect.

Base: rust-next at 2dee3d3adcad

This is my first contribution to the kernel, suggestions on routing or
RFC scope are welcome.

Thanks!
-Tristan

Signed-off-by: Tristan de Cacqueray <tristan@midirus.com>
---
Tristan de Cacqueray (3):
      rust: snd: Add initial snd_card binding
      rust: snd: Add snd_rawmidi binding
      rust: snd: Add active rawmidi_substream helper

 rust/bindings/bindings_helper.h  |   2 +
 rust/kernel/lib.rs               |   2 +
 rust/kernel/snd.rs               | 403 +++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 samples/rust/Kconfig             |  11 +++
 samples/rust/Makefile            |   1 +
 samples/rust/rust_midi_device.rs | 159 +++++++++++++++++++++++++++++++++++=
+++++
 6 files changed, 578 insertions(+)
---
base-commit: 2dee3d3adcadcc57d62ba6608cd02f50b0c10264
change-id: 20261011-rust-snd-c5e596867624

Best regards,
-- =20
Tristan de Cacqueray <tristan@midirus.com>


