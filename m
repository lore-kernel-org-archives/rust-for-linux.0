Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E9342070
	for <rust-for-linux@vger.kernel.org>; Thu, 23 May 2024 07:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716447796; cv=pass; b=NDg0AL4NSQ9IpC8MAOrrzeCAnavwIQH11HhsjLI7fdbsi7d4/wqr+5NpYWE+2saUdZFdzt7CVaFlffsLVArS/h5XZ5ttnYWtr/VpD/OTbqYYa7eNVlK/9q0HgPWZ0f6I5wwcUYxqNzob/Sn3j6+qfl3A585wdZehm1Zhgwx8fyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716447796; c=relaxed/simple;
	bh=6iNHqLVzlgdD5Kl8hP1qsc/0GFsyR0mzThQJL00thco=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=S/3Rua9ettmgTBDDhbPuSqGX+DUrEnuaCZdiRyJgKiglTSrJHCV5NNfWoaLPUdYUReLiw9yrgXInX9VvD8drDWE5eiJO/nMgi+lLRsTjPwxOM7Pw1xr2/AFYvdpZmdXsrXp9/oDyPAyBjdxJQwSBT5rEOGK9EXoEG9ROSFpQAv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=n0YnqUig; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="n0YnqUig"
Received: from localhost (91-154-92-47.elisa-laajakaista.fi [91.154.92.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sakkinen)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4VlJzM6Pz5z49Psb;
	Thu, 23 May 2024 10:03:11 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1716447792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6iNHqLVzlgdD5Kl8hP1qsc/0GFsyR0mzThQJL00thco=;
	b=n0YnqUig/CEij2sJGhHZEHSH4Z5g4URLNnoQLcxGb741ZVLZ4GmN35aUB4CQmMYua7oATd
	WAvy8v8OdPEujjBGybPN2HgGvCtLGEMecltOVySZK8WCvRKmNIohFDmwVErkmEIrOMFbXF
	1g6wyNBekOSKoHBYVOq90fFM/p9PUpjdBgeA2u+XFWNf+QGN8SnQOU5BuH6J9STkiwIF78
	QRw/FHf/wR5xpjId3sI+LLg4BUnMNSxFQF3Kw5rW0YdpLelT70CPRI8dQHCBsxYv7HlD/5
	0KZE/OdR+yqutdmQhnEa2G6e7jw5levnwJcbNdhFIJrcpnn5GSeaxruUtdgtNQ==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1716447792; a=rsa-sha256;
	cv=none;
	b=SombeEznFo18nu6aUVnEFMbiaxLWjewdRHyt5D+VcVYnkZRDqNNUe407Z37YtSYn94Wzac
	lS6EXt8BqyUkKUT/QsQaBLYnol3k/U3lBqxLai50ZSHHBh/k/LyRv+FyOK1O7ArsYyssW5
	uJqvGLNbrqjHMJPhVCfIJWQbb2gG7VyOHc9mCN4Y37s/bA+lvmBvLn0h8w26dMOkfCEUoU
	Ec2nhixhiNlVrq4OceL18Djadhvno9nSpxR2pYBkQq8abifhRfnkEYs5jiOoC3Vf/lq293
	26HnEhcTBX/91J8w+5Lu02SoUgOZnJBPhNrMSnPHfnMFhXtNYBY++apvT+NBBQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sakkinen smtp.mailfrom=jarkko.sakkinen@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1716447791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6iNHqLVzlgdD5Kl8hP1qsc/0GFsyR0mzThQJL00thco=;
	b=HbeGx5MY2cbTge4NZCY+i3IXb9TR96CWIjp2C3Ax3/l+1sGLAOKi+lQ2+m//LRdHD61kGc
	whFwV9B8cCZFo8OXBTrSvmUXHlAg0fEDZ8wkzk/dIyrxBbFAqQxVR3cv+ddiiGqNYYnwpt
	eRamSvPw04XAXfhRyMGyGqs4UjmNcTeoTJtf9SXnCf/w6XE0axB8YgNCa3EMB5XwkN3fno
	NJ9zzo0UlMLMiTiDK40abKx46/rtrxvSzpaM3M5aDEglHuTd0d1bUVu68UwEdkJguJMriK
	8wVDZFd9HuDOSz4indX6GXRiySfn/3cjbverwHreUbIfOvCdpKLS4won8qc81w==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 May 2024 10:03:11 +0300
Message-Id: <D1GTYLS0T694.20ADKJ10BM09M@iki.fi>
Cc: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>,
 <rust-for-linux@vger.kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>
Subject: Re: ASN.1
From: "Jarkko Sakkinen" <jarkko.sakkinen@iki.fi>
To: "Jarkko Sakkinen" <jarkko.sakkinen@iki.fi>, "Jarkko Sakkinen"
 <jarkko@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>
X-Mailer: aerc 0.17.0
References: <D1F44P3VLTBN.30LUQ60X5J3DN@kernel.org>
 <CANiq72=Kv217NDGf5sXgx+EYez=cs+hO50+YNnZf9oL2zxni9Q@mail.gmail.com>
 <D1FFABJRCD85.1EA4JBU93JT5Y@kernel.org>
 <D1FIPA4YAU84.M7Z9VMR4P739@kernel.org>
 <D1FJUW4RPWYR.38P76LESQMV4L@kernel.org>
 <CAFRnB2Vxez-i7Trxe-5ErAWGszVRt6MSvN7Ed-XOcSLVp8piRQ@mail.gmail.com>
 <D1G6UP4N7LP4.OUPA5JVLE1WO@kernel.org>
 <D1G7YTUR11EW.WIG4RQVBNCXU@kernel.org> <D1GTWC4OLYQ8.WIH9UMLI2LC2@iki.fi>
In-Reply-To: <D1GTWC4OLYQ8.WIH9UMLI2LC2@iki.fi>

On Thu May 23, 2024 at 10:00 AM EEST, Jarkko Sakkinen wrote:
> On Wed May 22, 2024 at 4:49 PM EEST, Jarkko Sakkinen wrote:
> > If we want to considering getting your code to land to the kernel I
> > would start with the decoder as it already delivers, as an
> > *experimental* feature. Then when it is landed it would not be
> > as huge stretch to move forward with the encoder.
>
> About the encoder. It is relatively new and has only caller, and I'm not

*only single caller.

BR, Jarkko
