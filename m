Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEB51A6812;
	Sat, 25 Jul 2026 17:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784999984; cv=none; b=gV2B+H5RRcfBYAnbj9uMNKgglQaEFpmS2Yseuw7J5mgLIjXT88XQqy7RwBccRYV9YpX0zdzEFIUmzUfblsrojKmQG/Z/S4UgjrReX9tjAlFwzlkK0NGu4e6Y3CPuiEX38L9Cw9vJGX1ccRay2bBSTYCfCnLgEJuyYyetlIU9CYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784999984; c=relaxed/simple;
	bh=BIbCfk8y2IjbAZapjwVey8Uxih3ud+qKuX3hj6DNsxU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=WDId3EvLHZtiGiqJ6u4+hN936rvwSNY7c2UmnFHDbCPR1xS8bRoFbxFA4pzOIBs5T8JGWz78upzSlqasf3xwkH5rTYqnxh55rgCm93tPOlP9nKTBCQz0e9NzJQ4H4t8kpSbr/KRbEmL1JDBPMcbg+RD8DtEj4n9LpshJ20pkm8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fabian.gruenbichler.email; spf=none smtp.mailfrom=fabian.gruenbichler.email; dkim=pass (2048-bit key) header.d=gruenbichler.email header.i=@gruenbichler.email header.b=dR0LsHgx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kkzJD+wO; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fabian.gruenbichler.email
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fabian.gruenbichler.email
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gruenbichler.email header.i=@gruenbichler.email header.b="dR0LsHgx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kkzJD+wO"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id DCEDCEC00BA;
	Sat, 25 Jul 2026 13:19:39 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-03.internal (MEProxy); Sat, 25 Jul 2026 13:19:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	gruenbichler.email; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1784999979; x=1785086379; bh=BIbCfk8y2I
	jbAZapjwVey8Uxih3ud+qKuX3hj6DNsxU=; b=dR0LsHgxMcJ9sDVHlkUpnJqz+c
	qoKUJ/0bmz5UGHke9OHkrEhBelEdQ/pEQyoFx7z1wkmlbpBRiPoOYwwcuJvAbXWJ
	aInLfuXF8wCyLUE3jEwdDfEt62xe1TwkvCHAUTBDHkeWIPQAwxUtEwy61F3j8nls
	CbRUmtTLcwUCJyka8hzVGyXpsYj/KJlQfel1LTtbwzW31Mqv9Qpru0ChiF6kyvWW
	+HRQmYg9LZWA9tK5qkFd2odWXIUWTw3C5c/eRvEs5LIUmVa+9ytIFHzNZTTHqKqT
	ucBBjZPaz6vsXt8EnEcc7q5QTtIXF1/PpU2YHJwqW8PoTTklAJyV4LD39RUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784999979; x=
	1785086379; bh=BIbCfk8y2IjbAZapjwVey8Uxih3ud+qKuX3hj6DNsxU=; b=k
	kzJD+wO83hZFJJH1Mw4yX/toKIWWlRDCEVvd4rVLV32XVJny7n4TUxVraJEdYbJs
	4la1UOwLWB8l1Ek4RL92z8PBPlAYFA7cK4+Lux9yEsW2V6jcC9Qbdb+YAKEBIgqg
	+Z/UkQ5dZ1n5my2GGfox5hfNfBXLeLtNXEc5BwbUtjiKa9J+X6vsLDXGkiiQuWml
	tkPGSN9+v9G2dYmPzfEGggTH/SMPUWFRtMeWgM8CEMUDMdoAjHftYqLrSAzUgB/h
	0yaiLKJpUd+FKDJ7WqBm4Ak4XQobh6RzujlcwkrFYgVaxprCRM7ylYMlNH5XRvgT
	LGNx31kHw/W515SrzxGcw==
X-ME-Sender: <xms:K_BkateFVty2xQJwTnWSIggiMZBoCyRHUAgu1q_HP-LN4MAuabZ4gQ>
    <xme:K_BkamD62Dwj003M3qLE2Q3U0OE-cMXPx-kIiykhcgk6nlF3jfRl5Qbxgytm9Xe1_
    F_mjAyXQDNxfKaqkTOx5FuzmMrgNcvVBtgbERHLF7OpnVZbcih0qEE>
X-ME-Proxy-Cause: dmFkZTGAtxvyazyv6rGowEs3U3z62csVYtGXRZKNblWa03nS3js855jT8l/6QH9uv+T1+i
    4ruddSY+OmUgtSKp+jweMKfnFM5AaeTaVuJsB6AGbM6+zwURViaRLNyIFCX9+hhhGo1QES
    iAhYiHkUzZvgeBi4y5M/mp5KRXXxGoeqJ4H9qLXUNM5vCg1K6JFXryB3dEwVJG0ePZcWe+
    LOxZkMl3HpI4glS5JEk95kb59XjpRg+mI8uM3BOjyYj8gg782K98nFUULbMOKGLE5n/THM
    4N1opd3+ahYt/h0tr9os8NnHtVlFiSEkCzCSOfynl0Iqvsyx3/o3HlwqRv839TJ6JJKSIL
    m7jub/gwioEz2wpLNdPjk4x7OOdc0BMT54RU66kmLjDogVVBVydv/9EIFAYJun8K2/IT7Q
    7iWcOYW6ZMoAXAfllyhk5q9fH7b7+rFd+pO36xX7O6goH/KJluAZgqNbs3Um19oykHAthW
    5sBNZE/pzdAYh49XVUo2UYuws+DBS4lb2mMspTFhM6c/WFQrATPwkPn0Z5SWguR9T/THUC
    gUq36D3W+esrvvgn6iqwqMD4JVUAmLYTdk4yOi/ZJKfdB8ZwrC9fOWXp3VpEbpqOJzh5lE
    cCPUMbCNCZeEqv4PSAW3OJlpp42jVUmBf81Si9I0XeYT4Juup2r21hRHytJQ
X-ME-Proxy: <xmx:K_Bkao_Yc_L8IjHMHs2tKQWBSp_KQavdiweuvnaLQvY7Cg-QRBE56g>
    <xmx:K_BkajywLCaAqhbbwanF2AIl0zVY8ToXoITKyfcHXPBaAaDmNgCQww>
    <xmx:K_BkaorJykIK81PQzc_f3f-yj0oy1WlKxSXj3yYAD0MmMvfXPeh33Q>
    <xmx:K_BkakpDpPE_47eru9Jn74yJN2grvADmE0MvM1rs-d70Rppb-U_dKA>
    <xmx:K_BkasWiuHZRi2yi16tJoISW9ahepGRm7HmQ4XyNhmwVc527S9gd3KOS>
Feedback-ID: i1739464b:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 915661820082; Sat, 25 Jul 2026 13:19:39 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AJ9MI3eEke2w
Date: Sat, 25 Jul 2026 19:19:19 +0200
From: =?UTF-8?Q?Fabian_Gr=C3=BCnbichler?= <debian@fabian.gruenbichler.email>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,
 "Christian Schrrefl" <chrisi.schrefl@gmail.com>,
 "Russell King" <rmk+kernel@armlinux.org.uk>,
 "Rudraksha Gupta" <guptarud@gmail.com>, "Ard Biesheuvel" <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <18cf2372-0558-4a90-8faa-bdb2ca1cef61@app.fastmail.com>
In-Reply-To: 
 <CANiq72nFZT0ZZS1R82qVjPg4A=FEU675-3yx+tv3XVA=twnUWQ@mail.gmail.com>
References: <20260331190053.482607-1-ojeda@kernel.org>
 <d47bcff5-ae97-4a27-8348-efef67ed3d98@app.fastmail.com>
 <CANiq72nFZT0ZZS1R82qVjPg4A=FEU675-3yx+tv3XVA=twnUWQ@mail.gmail.com>
Subject: Re: arm `rustdoc` Rust 1.85.0-only build error
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2026, at 12:19 PM, Miguel Ojeda wrote:
> On Fri, Apr 3, 2026 at 10:12=E2=80=AFAM Fabian Gr=C3=BCnbichler
> <debian@fabian.gruenbichler.email> wrote:
>>
>> I will check how the full diff for 1.85.1 looks like compared to just=
 picking
>> the rustdoc fix referenced above, and then file a stable update reque=
st. AFAIU
>> either option works for you?
>
> Thanks for the reply and the details! Yeah, the timing was unfortunate=
 :)
>
> Either works for us, in the sense that it is not a critical issue
> (i.e. it is just for generating the docs and just for arm32).
>
> Having said that, having the actual .1 release there is nicer in that
> we could consider raising the minimum version to that one (or perhaps
> at least print a warning if using .0).
>
> It also means we may get more focused testing and one less version
> around (e.g. currently I found this because I test our minimum, but
> generally I test the latest point versions).

Happy to report (with some delay ;)) that the next stable release of
Debian Trixie (13.7, planned for 12.09.2026) should contain an update
of rustc to 1.85.1, which got accepted into the proposed updates
suite today:

https://tracker.debian.org/news/1778462/accepted-rustc-1851dfsg1-1deb13u=
1-source-into-proposed-updates/
