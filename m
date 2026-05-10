Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AFF3563C7
	for <rust-for-linux@vger.kernel.org>; Sun, 10 May 2026 09:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778406587; cv=pass; b=mlEuUc/PEhmnaMAJh2nQInzTmzhL73ZTgbd4U0oPcRq6+WVBmFHHQe63LVU2AffNyWW04oLHCjHb9bazFMf03hB/Y58alO0/nCjLBA4t0SJbP1RraNFc16SS7tZ2xb94o9f4xiVzvPADN8nohgwaUNDqyIMYd+wuk096WJ+QLMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778406587; c=relaxed/simple;
	bh=lJQniN39MziSusnrSeOllIKVtVemIJd3P4RXjYACezk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K/FLEwV2TIvUAMFS2+mClo+hXgM+jbwpodpg+9Jm+AhkuoNSRjKjD2le13EgHIB0xU8G0322bhABB4SNXcCEsHVvpv7ovozgrTi3JQWRQ5PY8Y4l557JhvloT3FHIqIYb1/jMH8EwtVmt5f4AcTM3M5OBfFx+P7bYGTQ5C6TXsU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VeTCXj1q; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VeTCXj1q"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2f114d129c0so222598eec.0
        for <rust-for-linux@vger.kernel.org>; Sun, 10 May 2026 02:49:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778406585; cv=none;
        d=google.com; s=arc-20240605;
        b=TTVRs1AXhykcRtwBNtEusUEJdbXUtm/1Xmi+i6Do2diVU//orPR7yPnQcGISTPwRgV
         mC0jME9chdMufl9Sgp4R1Hy5dARl5nx7MNWbUBP9i7UCs/FsTODu/4ISqpnoKwR7iHZy
         KVECYY/dgBso58HWLnf8uzQu+jTOC1Ab8QteT8evS0XFgZH6EnPjFUYdvJICPTv5Nspl
         IiUjdHp/9FJSzUZkJrhlzySLf0TfsDhXFgl5nLGTOvl5VtrtiAbnKujqWyfJQ1vigHjh
         CuRzS/SIfR4WrTpmM76zoOUzrXDT2xwM1r1L6CwvLu6gyZLWaWCTgpxLTHy0zVR+s1mu
         Qd6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wLMtKHMfQwC2uO82mpxETiCYDm/FHV+08XCpd9Sqn5E=;
        fh=iZtq86ygURBwgzTfc0JILLoD19CeBgS6yUC1/RnhEFk=;
        b=fPG5Fx9FprQTUbO9j8nRI9hccCyocWOHeuD+7zxJiTiLNv/XGM2EanGQykrTpKrtVI
         0uyAaQrYhbh0C0O92LfVpVmCsZildSyBGFmeF6jA4XFYfqUzmVKbyMBDh3HJEilnij2H
         /gKwg00wSPU4jaIZJyQI9Fwd7lUiHEzWQR7pIGR1PM2w7iZ5NHwqyd7O2tLZSj077/oW
         IDUtqPrRgvI+8JsbPAsrFZd+RGjsAewJw+fpgGVEq5SMSoUiISGOtprPYYNPSScdhJ/d
         uF7QsrNKmhRmg16JrRvu5IwU/CEq1/PnO4KzcuxeXGze+UN6fIsGJYJInDKJ9CnqA+BV
         3fAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778406585; x=1779011385; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLMtKHMfQwC2uO82mpxETiCYDm/FHV+08XCpd9Sqn5E=;
        b=VeTCXj1qlRbFO7LmPcLoVI6ldZazYNphicwv/BaQTE+GH4MthQqUhTXxpYgP4YTK1J
         AZWyB6uG2zSytTYmqje/1AgdRy5DeAHtkKeT1BbwxE6YtE4fZInYkGakV8JsqEqHEDRo
         TXVCM46Iu4kuCoUhTQs3bfdgpnlJ3MB4eCgxJR5ce4a6xd7VE6U1u+/0XBQYxP4uuktF
         M6G7aJtkFSXSLdQ+nVAB2PtQD74ZuuG9SB//j3yPxIVrJFvDwxb8QRJ3HMUlH9vV0Sev
         4gi1BQtiaqawpx0jS1vjZGypefUn2OI9ZXL4abVGCHTYRk8RVTIM9AEwDO5agwlIvygn
         i9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778406585; x=1779011385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wLMtKHMfQwC2uO82mpxETiCYDm/FHV+08XCpd9Sqn5E=;
        b=JFatalt+1loJwTncds7D2/rWFXeFtn1jHqkwsLe5cYDNmJDGRYzvtvVdohFCUwuzL5
         Jzf2v2ygERBvmLykPh4bgObaVwNAWNlGrubhsqtrnpY8+1r8Rni7W50LIEq1dyvSxSBj
         rO9RcHv++1uP0/Rnm09wzK+M7zrsckgc6fA95tsxHG2R0cclobOw8uI6H00FS/RBfHLQ
         A0ejBQ/mrESarA4W6pQXs6n7dnAYtrN2OhsPW4ajpsWzkGdSKP0KGUW1O8LWciE2xqA1
         YPfIeFeL0d5AcxyykVxo+8H+WxmnwRJzRaNRa20j9Jcz9LsFuPSq7Lk8gfiyGfksJwUG
         eyDg==
X-Forwarded-Encrypted: i=1; AFNElJ+mwucpebmiOWGOWmB2V3/EnF7QIUDU5LPnvVUTDSF8saDsuMTdiVIy8B1YkYgVLgXD0FmcKdwOMTz5tYppyA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yycy6BJAjOjyiwoqQXVp51QGXa1V0JHfT5MK6HIHpHc1MvDkEdg
	BBaRXg/gxGhUgB2zpFnnjLF2OJot9uofiVz/WSTOz8kFeaQdizwJzflEi925tesuy1ibY107I+8
	COn9bT9m5J4QZTzmunbeM/ISxY09nP9U=
X-Gm-Gg: Acq92OGyFQjkZhFdvfSGV60LPw36YCcy1PQ0pOdM7blshQ2Bkm7smozXSrc0XuAExVv
	x1XdFsVOmhBsYk2EdgysSOp0sdO/IcrScHv7UJx7AkbMwF65NDRgES0WRRrM/oQINUh6rPy06VF
	5223Yn+yvJZxBuUJhWBtGOyIEgB0+39cAJXtiTssWLoJLGs6Ebl8Mvfrlzvkwl6m/fBHE6ATOYT
	oUOCnuT74wMXOoY31zCO2Aa6HKAHXkX6zpPBMHqR9FNTOiwR9dsBCbS6LCBSei9HXfpk4dhfnah
	JcP0aDhOy1t8vYI+IxBKhjZ2gtdetUtGVUf/mIT42CIyjZMe4nqbX3Jza9nhCH7S/OxdU7quQ1t
	MlDrlkpRFnK+eQggTkHGhF74naVKANRX25g0Nb2p0+ru4
X-Received: by 2002:a05:7300:d511:b0:2ea:de28:f389 with SMTP id
 5a478bee46e88-2f59fed19famr3955753eec.8.1778406584746; Sun, 10 May 2026
 02:49:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260509203808.1142311-1-julianbraha@gmail.com> <q02rn6o5-5pr6-1744-6os9-1052roro79s8@vanv.qr>
In-Reply-To: <q02rn6o5-5pr6-1744-6os9-1052roro79s8@vanv.qr>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 10 May 2026 11:49:31 +0200
X-Gm-Features: AVHnY4ISEl_kLYwIQZ64WmR4duBVOb0clDciE4kHT74zzm-QAgeyD8jr_6WPd14
Message-ID: <CANiq72kUD=s7VkOUBNFLbcASvDoO_qFXHziOcSFdDqtg5NXoUw@mail.gmail.com>
Subject: Re: [RFC v2 0/2] add kconfirm
To: Jan Engelhardt <ej@inai.de>
Cc: Julian Braha <julianbraha@gmail.com>, nathan@kernel.org, nsc@kernel.org, 
	jani.nikula@linux.intel.com, akpm@linux-foundation.org, gary@garyguo.net, 
	ljs@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org, 
	masahiroy@kernel.org, ojeda@kernel.org, corbet@lwn.net, 
	qingfang.deng@linux.dev, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 10, 2026 at 7:06=E2=80=AFAM Jan Engelhardt <ej@inai.de> wrote:
>
> Good lord, how is anyone supposed to review that amount =E2=80=93
> or is it just getting rubberstamped anyway?

Yeah, if one really wants to statically vendor the files, then please
follow the pattern we used for other vendoring: see the commits that
introduced e.g. `rust/syn/`.

In particular, we try to cut down there the dependencies and the files
within each dependency to those that are actually needed: no need to
support vendor optional dependencies that aren't used (and if they are
used, please try to see if they could be avoided), no need to support
all platforms (e.g. why do we need FreeBSD files here?), no need to
vendor the tests nor scripts, and so on.

For instance, for `syn`, I modified it (minimally) to cut down one
dependency. I also provided a script in the commit message to verify
the files are 1:1 identical to the ones upstream (before adapting them
with SPDX identifiers etc.).

So, from a quick look, here I see files like:

  scripts/kconfirm/vendor/vcpkg/test-data/normalized/installed/x86-windows/=
bin/freetype.dll

Which I would be surprised if they are needed.

In any case, when we discussed offline building in v1, that did not
necessarily mean vendoring every dependency manually into the tree,
but rather let the user set up the dependencies before (i.e.
connecting is fine) so that then the actual `make` steps can proceed
offline. For instance, using `cargo vendor`:

  https://doc.rust-lang.org/cargo/commands/cargo-vendor.html

In other words, one should be able to have users run a command or
similar, and then use the dependencies that are already downloaded.

By the way, another option for that may be using the distribution's
registry (e.g. Debian and Fedora provide one through the package
manager). That is even better (and we were requested to look into it
back then for `syn`), but it does introduce complications even if one
assumes Cargo is available (which we don't so far in the normal build
path), e.g. the versions need to fit, one still needs to provide a way
to do it for distributions that do not match, etc.

I hope that helps!

Cheers,
Miguel
