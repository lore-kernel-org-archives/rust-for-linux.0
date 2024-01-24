Received: from a11-123.smtp-out.amazonses.com (a11-123.smtp-out.amazonses.com [54.240.11.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9182C77629
	for <rust-for-linux@vger.kernel.org>; Wed, 24 Jan 2024 14:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.11.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706105833; cv=none; b=qjgE7LFky+6H3D657+YyGLNEZnaIXfoskBlwmtaq/g36m8j4nz+nY6BmZNQgHPNgwDFfgaMh/5gH25k0Bf9dhWpE3gxBTMZM7K27x7TA+gpzsMl9WitIhCVpfpYxwQi4A5IUHOvicghLEIYnQgImh+QyPk7Y3W6IRB/a5dxOU+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706105833; c=relaxed/simple;
	bh=XN1qx8y1mppKvJSwvV3Skp7X0ON0SH0De5ohqhIDTaU=;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:In-Reply-To:
	 References:Message-ID; b=AVlDCMe1yHMFHJYMdwwuCyhLNAu+wUFtLpYVLlNPY31u87BhZduz4kSBpLg3Z0SiHJLR2NpL/IB3iTd7Z50HQ8SvIWc8/ckwAHdJfmAlupBFK07CCMEGfRsw18TcSEHqpD8i7hL2aCP6JhLFt7xL1e8OqSoN0NqBGtnZdLNgSnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=obei.io; spf=pass smtp.mailfrom=amazonses.com; dkim=pass (2048-bit key) header.d=obei.io header.i=@obei.io header.b=L1bbWq8H; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=H8dT3/YT; arc=none smtp.client-ip=54.240.11.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=obei.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=obei.io header.i=@obei.io header.b="L1bbWq8H";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="H8dT3/YT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=ph73stw23v46e7miqo4f44bv344ybkbc; d=obei.io; t=1706105829;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id;
	bh=XN1qx8y1mppKvJSwvV3Skp7X0ON0SH0De5ohqhIDTaU=;
	b=L1bbWq8H3iBMlaKyEjPaaDf0xS8IDtCjMA1puJ/e2qLr5isRtI6Pv1TqhgucCE8+
	zHITtQO1m4WsLIX7fizOVZVFxDuEFqTfvxDMMH0wNZN7SYHJDdD8A14ckXZkAhlGJJ/
	UqSItpp+jWuZddTDHudnl86k2r2FlpDmZttnS1Wa7uQFkLCsebGZMGigEgTtt1mHAsm
	gvtbMps/snKPJq9VpZj/HHBqx281yo+eHRIw/3OIOPf01V/Yp3xXWqSCLVwLKcsZd6/
	DtdNUiT9y76y3ZS7a4nvqM9K+p/5b4RqMWCwJ8W50feclDjHAf54CPrwaeD691PxUtg
	3EauxPOz1w==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=224i4yxa5dv7c2xz3womw6peuasteono; d=amazonses.com; t=1706105829;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id:Feedback-ID;
	bh=XN1qx8y1mppKvJSwvV3Skp7X0ON0SH0De5ohqhIDTaU=;
	b=H8dT3/YTYWiMOFpvR5D0MxCJ27W01a8+eUDUTjWcs2ALtO1x7CcVwjTQ7QMCdLPi
	+VZj0bFmEWSJkLeEQp74Jt4tubMr3to6KHS2nPlk3UCRNmgcJWAcUZQTWt5W6eselWy
	3wQc/eS8knpVpV/g8AjEuizhvuQnhmkN+p61Fjgo=
Subject: Re: [PATCH v3] rust: types: Add `try_from_foreign()` method
From: =?UTF-8?Q?Obei_Sideg?= <linux@obei.io>
To: =?UTF-8?Q?aliceryhl=40google=2Ecom?= <aliceryhl@google.com>
Cc: =?UTF-8?Q?a=2Ehindborg=40samsung=2Ecom?= <a.hindborg@samsung.com>, 
	=?UTF-8?Q?alex=2Egaynor=40gmail=2Ecom?= <alex.gaynor@gmail.com>, 
	=?UTF-8?Q?benno=2Elossin=40proton=2Eme?= <benno.lossin@proton.me>, 
	=?UTF-8?Q?bjorn3=5Fgh=40protonmail=2Ecom?= <bjorn3_gh@protonmail.com>, 
	=?UTF-8?Q?boqun=2Efeng=40gmail=2Ecom?= <boqun.feng@gmail.com>, 
	=?UTF-8?Q?gary=40garyguo=2Enet?= <gary@garyguo.net>, 
	=?UTF-8?Q?Obei_Sideg?= <linux@obei.io>, 
	=?UTF-8?Q?ojeda=40kernel=2Eorg?= <ojeda@kernel.org>, 
	=?UTF-8?Q?rust-for-linux=40vger=2Ekernel=2Eorg?= <rust-for-linux@vger.kernel.org>, 
	=?UTF-8?Q?wedsonaf=40gmail=2Ecom?= <wedsonaf@gmail.com>
Date: Wed, 24 Jan 2024 14:17:09 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
In-Reply-To: 
 <CAH5fLghtZK94Co2+0agG91SZQrqke8H=oyHfmRxi2KbRTPJp2g@mail.gmail.com>
References: 
 <CAH5fLghtZK94Co2+0agG91SZQrqke8H=oyHfmRxi2KbRTPJp2g@mail.gmail.com> 
 <20240124141632.546912-1-linux@obei.io>
X-Mailer: Amazon WorkMail
Thread-Index: AQHaTrkR834YhMf2RJGh30NlrNjP4wAAtndRAAW8gIw=
Thread-Topic: [PATCH v3] rust: types: Add `try_from_foreign()` method
X-Original-Mailer: git-send-email 2.39.2
X-Wm-Sent-Timestamp: 1706105827
Message-ID: <0100018d3bd4f712-766b98b6-4052-4e7d-b6b7-19c4a793a33b-000000@email.amazonses.com>
Feedback-ID: 1.us-east-1.LF00NED762KFuBsfzrtoqw+Brn/qlF9OYdxWukAhsl8=:AmazonSES
X-SES-Outgoing: 2024.01.24-54.240.11.123

I will change it to: `ptr` must either be null or satisfy the safety requ=
irements for [`from_foreign`].=0D=0A
