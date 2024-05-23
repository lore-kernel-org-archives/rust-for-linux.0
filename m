Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69F53BB30
	for <rust-for-linux@vger.kernel.org>; Thu, 23 May 2024 07:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716447627; cv=pass; b=GP8VZGodcRm6n0vUm0iHtd0i2it0y/r5Q64f38AxyM2y2uPy7xQb6PqcE/YE+LM3yUspTcJBrQnQUOGN3M8qLMyw17suBYsxO/AApJqUEtH/xHx4SjhXijktjTVexQtRB2miFwup8A9TPdtRhOIoziHpKFJ9Nc8zEPfSBslNO5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716447627; c=relaxed/simple;
	bh=3oSY+DPQiU2H7YEH+aAcK1EQbOB9q1ZbOHy0VgiL07o=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=VMkIQhKvLvJ0jnta7FWMH1pazuyq1tAOEXiEpR+0F04pu4iS+mU2ToH/PXSFKhkTJ6hwJEbsBZ8GDbH0DACpGiv1izlZhx4sJf84HD/CmIFOzOBxtL/oScmZGibOAtrz12RtDyjb1StkgpuEFURPs2mykeADE+cKcC3Q8nyzTfc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=T9UYcmaD; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="T9UYcmaD"
Received: from localhost (91-154-92-47.elisa-laajakaista.fi [91.154.92.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sakkinen)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4VlJvy1mGNz49Psb;
	Thu, 23 May 2024 10:00:14 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1716447614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oOzy23cUkJcQVqXdrE3pXQdTVddahnam+9dh4Udc6jM=;
	b=T9UYcmaDNphzJQc8UBu87/OruiUNI7ffgMB7VvBOdiEpUuCCTdN4OGNVhsCIbV73vQ4fvd
	AsjplaaCzR4kJlhXLg/qugvYXLiHnQCDgMBXI1hsCT8H49jUODGRTBdUAPJSm7nfBpr4Ge
	YrOLFQgUhfaYkc2dGm/mFgED9ZUoLYcVkA3OEo27cwz4S4GZdf9X5Q6WbHvc84RiqsC5j0
	zZFpDvF3/G1EP0bsZ6cL2NZzk2Avp1ydMsjaJOIY+sJdQzW2cGQsLJpL+J5uHYkdhUHatc
	vpGT5a8mHYatvmpNreovTM98KCRd7vc5MFMFL1TRQLoE4LUp4XLQOd6EAbzLsg==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1716447614; a=rsa-sha256;
	cv=none;
	b=jRyhOWUCWcjGFnUixUODAqn3013TL97+FJgt7iEkeQcWQq8m9PsSVp2bDlZULX3t3jxpyN
	M6NhmU53YcxyX4lFb434LUrMfuTtai8nCi/qdlNbuFWBb695JnjL2VTNODaKEgYk6LCQeD
	JYAEeZDVoSJNQaWF1do+73f5sAT1VKPRhULPxg/XkONzuvc1QNyrAuPLoWH4Xppf3svCNw
	WjfALI8l4RHitFr7DZo33sswuxMjCMPvOj26Avruy3OcOpWmJZVeCORzN4CjY2pH3DhFST
	gjwMjS7E/zFsnj7bl6hlerORFAdY0LNBdefiguXW35KJOZyrL4St6rP++X40zg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sakkinen smtp.mailfrom=jarkko.sakkinen@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1716447614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oOzy23cUkJcQVqXdrE3pXQdTVddahnam+9dh4Udc6jM=;
	b=Ke4BGmKKbL6wgEnF5gyjKpXxQPf2uyPT3jELMlZOE9DRbvmErQYFQ8YmZgAL5UeBTZRBg3
	rNAu7wx1q2lvueMfcChj4HkRZrySGff6rt/5tsPH6wJ2ccaCgW0eAHXbwKKJp+ohLjeKH6
	iKDk+KJibbWXuZRVt4wS3aXKhDMb+1uOUCN2HpEGEinPPaBun9o5tXfTUubCglA1IpRexV
	o78FYoD94VCXPZpPDJVYY8ZDOQ+HnQTRykiI9MPe0aMJW9OfS9nopzLBHO00MT5fWrYKW0
	pjYQciX6m2Je8nERzKr7RIDcCByuyI8OrlpZFzBWpG4aVWvJ3iFtzzv5HwE/WA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 May 2024 10:00:13 +0300
Message-Id: <D1GTWC4OLYQ8.WIH9UMLI2LC2@iki.fi>
Cc: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>,
 <rust-for-linux@vger.kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>
Subject: Re: ASN.1
From: "Jarkko Sakkinen" <jarkko.sakkinen@iki.fi>
To: "Jarkko Sakkinen" <jarkko@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>
X-Mailer: aerc 0.17.0
References: <D1F44P3VLTBN.30LUQ60X5J3DN@kernel.org>
 <CANiq72=Kv217NDGf5sXgx+EYez=cs+hO50+YNnZf9oL2zxni9Q@mail.gmail.com>
 <D1FFABJRCD85.1EA4JBU93JT5Y@kernel.org>
 <D1FIPA4YAU84.M7Z9VMR4P739@kernel.org>
 <D1FJUW4RPWYR.38P76LESQMV4L@kernel.org>
 <CAFRnB2Vxez-i7Trxe-5ErAWGszVRt6MSvN7Ed-XOcSLVp8piRQ@mail.gmail.com>
 <D1G6UP4N7LP4.OUPA5JVLE1WO@kernel.org>
 <D1G7YTUR11EW.WIG4RQVBNCXU@kernel.org>
In-Reply-To: <D1G7YTUR11EW.WIG4RQVBNCXU@kernel.org>

On Wed May 22, 2024 at 4:49 PM EEST, Jarkko Sakkinen wrote:
> If we want to considering getting your code to land to the kernel I
> would start with the decoder as it already delivers, as an
> *experimental* feature. Then when it is landed it would not be
> as huge stretch to move forward with the encoder.

About the encoder. It is relatively new and has only caller, and I'm not
sure if we care about it that much.

In my case I just did:

static int tpm2_key_rsa_encode(const struct tpm2_key_rsa *key, u8 *buf)
{
	int pub_len =3D key->pub_len;
	const u8 *pub =3D key->pub;
	u8 *start =3D &buf[4];
	u8 *work =3D &buf[4];
	u32 seq_len;

	work[0] =3D 0x02;			/* INTEGER */
	work[1] =3D 0x82;			/* u16 */
	work[2] =3D pub_len >> 8;
	work[3] =3D pub_len & 0xff;
	work =3D &work[4];
	memcpy(work, pub, pub_len);
	work =3D &work[pub_len];
	work[0] =3D 0x02;			/* INTEGER */
	work[1] =3D 3;			/* < 128 */
	work[2] =3D 1;			/* 65537 */
	work[3] =3D 0;
	work[4]	=3D 1;
	work =3D &work[5];
	memset(work, 0, 8);
	seq_len =3D work - start;
	buf[0] =3D 0x30;			/* SEQUENCE */
	buf[1] =3D 0x82;			/* u16 */
	buf[2] =3D seq_len >> 8;
	buf[3] =3D seq_len & 0xff;

	return seq_len + 4;
}

Not the prettiest looking but it does the job and is actually easy
to verify :-) Decoder is on the other hand old and mature and makes
more sense both in implementation and architecture.

Looking back it was my mistake to let that encoder into the mainline,
I did not use it because it did not make sense to me, or at least
less sense than above, which practically never changes and is easy
to also later verify and fix, despite being somewhat archaic.

Given this if we want to work on ASN1_RUST experimental feature, I
can create a patch that open codes the call site in trusted_tpm2.c
and thus ASN1_ENCODER can be droper entirely. It is not a priority
but could be part of the patch set, or Git branch, which adds
ASN1_RUST.

So what I might do to move forward is early next month to start
with such patch and create asn1rust branch to my tree at:

https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git

And then start looking at the crate and perhaps post here a more
refined suggestion how to move forward.

Early next month because I have a conference demo to do (actually
in Rust but not kernel related) by the end of the month.

The reason I'm concerned about the topic is that keyring has literally
billions of users dependent on it (mostly without knowing but it is used
practically in any Linux installation) and I know that Rust side needs
ASN.1 eventually, so I want to make sure that the integration path works
for us.

So let's now pretend that encoder did not exist and focus only on
decoder :-)

Sounds like a plan?=20

BR, Jarkko
