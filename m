Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794658983;
	b=iC3suEU5qfgyRaJZF8NjC5g0x+VCr1v2Xy4vikontmIb61I2jejoskY5BKpmqLwghCCt
	 5yxv7qyK13m93ssIOgEI5Kg84p+rVR4Fx6JQigV0yRC/ZHo94/DHCAlhZ0k+u9UrRKrov
	 RRoZvc6pr6b8qsoBmGyJzWa/FKzRRo/X/hdEDJGALwt210Ht/z6ewr6YXNcHScRnrUsUI
	 SruD+6gCSl0yXh0yx3mkQBmeAC+hbc0G+/lvfZPp//wQKOMzrHf5MNQrvQ643+GFSLvr8
	 LmC/spuRfXaIwiS17EKKZ6zqHzKHQyEdFr0oP25ZOscDglykNHu1ct/of43OA0ScdEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794658983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jaNJY6v8J1Y8dmYnPR68moVodtYgswY39S/9vFvJmC8=;
	b=HZt8soy5zvmv89JAsdhHVJ4rUR+N1oEXSJie9VChnpVZzp16kfw1nDtZAo2GCPgsyQNW
	 qxPUsJyMd3cVb7jIcnJzbjx29SNG0Eyu9XqTg6YdoTbszQiNi4IdaaJbFEXX5oxdepkSb
	 mkFliW1JH9AlmpXsKbAWCvFJX4lZgIA2S/dlJZ+h5t9YWht4vHQeG8X485AHpGDiPAaWY
	 gBgCS4NIu898OgB3Y/7anCqwr0F/BjGayXeABkf2dvcOOdP9H0QMWIZ8cO/MIhyqFomxM
	 FeSRmlj6njqmgh9QCSK/PNVJj4eb+rNDEzNQcezywJASCN5FgdGYJfvCQoCjaawAfiw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mrW3PskT;
	arc=fail smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23033606A327
	for <rust-for-linux@vger.kernel.org>; Sat, 14 Nov 2026 12:23:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23033606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mrW3PskT
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36d1b3b9974so158668eec.2
        for <rust-for-linux@vger.kernel.org>; Sat, 14 Nov 2026 04:23:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794658982; cv=none;
        d=google.com; s=arc-20260327;
        b=jODRY0b/yX8mdX8lEKS2ts+/ECa1nlUeczp4MKZ1HGeZhCsGrUW9DAzqqosB4zmhKe
         hdu5r+pEQQYg/bGx3poEC6p2QS01+kZgsLQAUvAm8Mkg2v/YgKRpB8d2ZBe5XK35dVYP
         NxY1ViGVprgPA4bmZ+l7ptVCu5HUSqgdEBmxrzxXHkJGpU0bHVpS+vpOGHV3vR87LUpx
         1O02Xh5ckJRYyrHr4AK2i2DtN/+KxY4yfDAdCzBDi03etInG5kQVMbq1N6mwADcaKKoK
         ep9RsK9Z2UndG0IGfUR/JJmUllT4tUgY2c4bvW/RCtiI+QSwesqNH03R/4XlhVK7Tvk0
         cWuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jaNJY6v8J1Y8dmYnPR68moVodtYgswY39S/9vFvJmC8=;
        fh=QPDj5lX/v2uMQd+kDq1lyIJA/G65DJbfzE91eeDYZ7o=;
        b=OfSNz68juhXEqwbUuX8NdOLOBLg8C4kaMeOmrhU/6OD41rFYLpM0QWcRn51PN6f8YQ
         VliohSyvACaLzSbHmufnzYNsDrIJvXIbvMdI0gONoVBDe4vA01ZRQP4QoKnU32g9O1PF
         Sj2De1xuo2VFXByIqrDPUhSI3wmxp1HuO+sGAPIT3pD/cxRDcdmwI9YQ1ik8CCIDBBRA
         7jUGoT+vYeCIB+4qRv6v7Y93O5vehSNilIc7JVoSZ5vkKOGTa9DA7q2Vf7mpELrPQEtN
         OpUPpxtde+HW757QqdmQ8+amyng2xV0MePd2H4+d+qmpRLvwQ5nkmwxlV2SrjXZj8fyL
         Entw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794658982; x=1795263782; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jaNJY6v8J1Y8dmYnPR68moVodtYgswY39S/9vFvJmC8=;
        b=mrW3PskTmnsNOOseh5Gis6ckRmbh0AIZ6Qv5S1YkSotxYQm37tB6xWksud1ckFEEj1
         j5fNinNXKG8GSXDAWrLhPrJtYaVFYCgDxfSmVsRdVv5CIfEvuaTnNrVi29BFTct8aqU6
         fAUWLdiUIVA3uadM0pQdgD8kpBt8GMGgcpLyD2jsgBaV+lu0F8C4TXOm2XsmW94WwkVF
         zxquXD/a97LUoPYuvsrL0Bfsnee/kWrO061zcqDkzNjp2FB2eny6V9BqYVRqg7T+/LN5
         OCQWxQ+PpRwXkffLFAHhachAlw7lLEIECOkQlXvPg/LG6arcgExxlroX7yP1xMML72yA
         s5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794658982; x=1795263782;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jaNJY6v8J1Y8dmYnPR68moVodtYgswY39S/9vFvJmC8=;
        b=xB4HE5HKA5c3QRvYkZA3OilQVkz+/SuBzkLIcf1I+aHhpStY2d8mbdu2QeQHjxsY7T
         GYpNtZ2CzaOc326F0Zu4O0o9j7lHbZ62vpt/CBlIJ1mfEUMQmvysiYZBleeHKnU3RNK+
         Jq6M4EB1Lmv+QjK6gzozrqZOxzxO5ZIhkSW2j9Gc3rclrN+5wsh3tszH33L++TtOE+UG
         DSTWGJp3b3foJfR+BjdyATbgz2yBzZGV5uP7WgQ7cBeVXsCX01QeVmlWFRDf59nREGwb
         d6qm4lAJvR735GJi+DE+XQkOlFf2JxSZeUQPQmqg8sotr8N2TUJsNkmsZgCMlsGvCkve
         ZtZw==
X-Forwarded-Encrypted: i=1; AL+hErF6knhvsPCaUtM8sNg3somMnIQA7BMHcmKGN3udGUq3GidhIDhdkrZXQrIIKpgUm9n/lMoZgdAwTDkbeSo4TQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/enry3HrnL/JGABse91B27hNYLWEfdZ2pQEMaXlKWWG/i8M66a
	aTE/HVhADAuW4DY1f0/7qGoPpPLAl4XWp891fyQ2niMq7WgRMPhqplafn8HLbKUv6e08TBYK3u0
	U8f0CxleBR0qEG11TmSNxl9VCms+wZis=
X-Gm-Gg: AYBFou0D88neT7UgAz9tyulUMQ4Yx7GzbKFiSFbFeXBzJAamYgUrJCSi4whjqhcqFCH
	boDL04e4nbzRC1sfdVxK3+8mX4C9DLu34Kvaf5RsEPg/LMklQuuWcvS4IsrvWO+U4E8RR8VUgD1
	5DGu2zURUbtN6SeZgBSSBfFMjAnWSKTted9D71bT6hrDAh/3StrHRvG6bXei0OsO/Og6NNrIxU7
	sVjSEsrekeFg+6cDmhGo2EqHoz/S0pdrC4W0qsDKM9N4LKlWb1MrAHJSeRFfnWaodbSE3abDhOL
	LkqTySUga39Uh4Drgtq9xndzytQTqyXQGnPMCOFQuRDWt4tG8NTXrt46Dm2eRTuC6hwD//Vavr2
	Ww/b47bbDyik81X1IYIsn4CMXhu2UHVFus5in1EAUXMnZIkLbIUBeDmKgFYJoeGwC/koPtVF/Ua
	n3SXT5vAbJzSWk38s66ap6E1AS4mNHIbPi1PDC2FNJUTomPM1mFmPvdpRFbJPm2psLAu2deHbV+
	cqtAxGTUqRUI7//5vb6Hh7aFBmtLrLBi/FPKZ2Ux9oZVB8KyK07CRN/LQeHoQ/FJ+Bo+aSCdDhe
	uO/ZX+VHO3wfaLz85Q==
X-Received: by 2002:a05:7301:a0a:b0:375:f846:5b3f with SMTP id
 5a478bee46e88-3796057e734mr6801706eec.0.1794658982031; Sat, 14 Nov 2026
 04:23:02 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <avXdJyqNNqopuH2_@ashevche-desk.local> <CANiq72nw+g=RTvR-zZh29D0=MOwNYboNSeKkNr_Z4v74Q4hn1w@mail.gmail.com>
 <avc-fQWSvmtHhtCO@ashevche-desk.local>
In-Reply-To: <avc-fQWSvmtHhtCO@ashevche-desk.local>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 14 Nov 2026 13:22:48 +0100
X-Gm-Features: AclHuK9W-7_405GhRgqH984WkaDHdvlAUVLqko1dAoXTj2-Ely9eZMICKWwSnJE
Message-ID: <CANiq72=RbzZHgZEMfLkDRQx-_PoxEfgL_Ar8figchde5u5qc=Q@mail.gmail.com>
Subject: Re: rant on Rust in kernel
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, ". Boqun Feng" <boqun@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 5:44=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> Yes, indeed. Any idea what to do (see below)?
>
> Ah, it seems I was mistaken, the distro is Debian trixie which sounds lik=
e stable.
> Unstable is on my desktop.

If you want to build with Rust enabled, then you need to either change
LLVM or `bindgen` to fit the equation above.

So, for instance, you could build with an older LLVM (e.g. LLVM 19 is
the default one in Debian stable). If LLVM 22 is around you may need
to use `LIBCLANG_PATH` to point to an older one.

Or, if you want to use LLVM 22, then you could install the `bindgen`
from Debian testing or unstable (they have 0.72.1, which is new enough
for LLVM 22, and checking in a Debian trixie container the build
succeeds).

Or you could build yourself a `bindgen` from scratch:

  cargo install --locked bindgen-cli

That is the easiest route, and takes just about a minute to build, but
requires trusting something else than your distribution. If you do,
you can use `make BINDGEN=3D...` to point to it, or you can just put it
in your `$PATH`.

I hope that helps.

Cheers,
Miguel
