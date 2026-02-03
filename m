Received: from forward500d.mail.yandex.net (forward500d.mail.yandex.net [178.154.239.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3933D2FF7;
	Tue,  3 Feb 2026 16:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770136372; cv=none; b=HjexZRNf1a/q76fhOfwZsanWWj7sFlQ23Lzxi1pWkS/sUVpDYkz/YCmuwbcQzZTvtpD7Mya3Z5XxpxGZFrDYul2GH46WNFs9wDZfgwVdVRrMg4rVobyqtnxfywxlm5wFbw43ZU6CYTSC8PBjB2NC6bqxXbnpu2Nxw3xTUaM1GJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770136372; c=relaxed/simple;
	bh=vlbWx09a11omy1TMl1xJviNnKLkHQ2DtmEON1gZIAac=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JseCMJCEV7+jJw27ZfCZmA29gsKa3b/Z7LQ7EDb4znYLKSiW3JkpyO2l4tFhADtI9Uve03qlIBEGPEjyjMAQ/Zt/2DFHtB1gw6yNf3TenZeSCjcoQYlPjmb8jV3z7PIEOmLriSkDU3ZiiU8Ms+fN4dS6FfwaoOiUaoZS9v7ErTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=Umt3/kkI; arc=none smtp.client-ip=178.154.239.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="Umt3/kkI"
Received: from mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net [IPv6:2a02:6b8:c43:4702:0:640:9195:0])
	by forward500d.mail.yandex.net (Yandex) with ESMTPS id C09118283C;
	Tue, 03 Feb 2026 19:32:46 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id gWrHOIFGr8c0-Uod8yNc9;
	Tue, 03 Feb 2026 19:32:45 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1770136366;
	bh=fzdqxbTb1d9xxD1rXXDpLOCQw/g++Osf3GHjVpMKko0=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=Umt3/kkI49ww3joWGhNUNu+YNckcCbfG6OODiwKpixUE4vkSj63EmoZwUEtyBnOjY
	 5ZnoC5z97N+4Py/DPJmuWf5NGzRXhwsSoPbonmGTDyhB5Ym2ITZyqPQZCLjz6FAAFm
	 DsEB8Whw6d5/7DFsIJMgW8YOM71FwrNaIEgeo3uI=
Authentication-Results: mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Tue, 3 Feb 2026 19:32:40 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: "Gary Guo" <gary@garyguo.net>
Cc: "Jkhall81" <jason.kei.hall@gmail.com>, <dirk.behme@de.bosch.com>,
 <joe@perches.com>, <ojeda@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] scripts: checkpatch: warn on Rust panicking methods
Message-ID: <20260203193240.68bb136e@nimda>
In-Reply-To: <DG5GBHGZV86X.2XKAU6WLWCL7Z@garyguo.net>
References: <288d4aeb-af0d-4d50-bb0d-7a046abaaf10@de.bosch.com>
	<20260203152542.45017-1-jason.kei.hall@gmail.com>
	<20260203184933.23c92f8f@nimda>
	<DG5GBHGZV86X.2XKAU6WLWCL7Z@garyguo.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 03 Feb 2026 16:02:02 +0000
"Gary Guo" <gary@garyguo.net> wrote:

> On Tue Feb 3, 2026 at 3:49 PM GMT, Onur =C3=96zkan wrote:
> > On Tue,  3 Feb 2026 08:25:41 -0700
> > Jkhall81 <jason.kei.hall@gmail.com> wrote:
> >
> >> Nice, emails sent from gmail get automatically rejected.
> >>=20
> >> So, Dirk.  To satisfy your concerns the current 10ish line
> >> code update is going to slowly, after many more emails
> >> written in nano, mutate into a franken-regex-perl beast.=20
> >> checkpatch.pl is already huge.  I'm not a fan of this=20
> >> approach.
> >
> > Me neither. I wonder why we are doing this instead of using the
> > unwrap_used and expect_used linting rules from clippy. This would
> > catch the problem much earlier than checkpath since many of us build
> > the kernel with CLIPPY=3D1 flag.
>=20
> Because it's okay to `panic` or use `expect`. checkpatch will just
> warn you once when the code is introduced, not continuously in each
> build.

That's interesting because it implies that it's okay for people to use
them without "// PANIC..." comments. That sounds problematic since it
means some instances will have that comment while others may not.

In my opinion, adding a clippy rule and using "#[allow(...)]" in the
places where it's acceptable to use them makes more sense. This is at
least more consistent and doesn't bloat the checkpatch file.

Thanks,
Onur

>=20
> Best,
> Gary
>=20
> >
> > Regards,
> > Onur
> >
> >>=20
> >> We could just not do this. Right now we are trying to
> >> get a warning if someone uses rust code that can cause a
> >> panic.  Software Engineers are smart people.  What if they
> >> just don't use rust code that causes panics inside core
> >> files.  Problem solved.
> >>=20
> >>=20
>=20

