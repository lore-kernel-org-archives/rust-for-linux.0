Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB96F4E5322
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 14:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790779291; cv=pass; b=rB67c4cghldoJKvuOUS34l+gBP71TyvnCjj40nSkQfnlxKqGpttEx//FEJSyDa1KlrqiZNxg7lNL0FS/Pmaaq/75+Vxs4g1z4kZ8sKHGirn/GJsnNK/S56Cad2H7gvH2httVzieFdtDGcpntn/+3QlOa8ENgj0Qh2FoX6EhKXrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790779291; c=relaxed/simple;
	bh=9sp+r2dymTSIz3G/KUyoL3W5ou2ax6jh34iwuHuVsrY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cSQ39zbDUcmnZ/RjHepMiNhBli4iPCHZCKb4snWxlPaL9x4nAI+vwAsQwZw0qzyoRVFDRSqWTerySE8iNNudDmf/2bK+h8pCEagaNsoitMUH8mpgyGJp2J1zMumk7q/tPimxRq1ERR71QqKgvyy2ds7OSKsAazGlj2dChtYDkxY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qpFRu80c; arc=pass smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qpFRu80c"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-32be7127c64so613949eec.2
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 07:41:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790779283; cv=none;
        d=google.com; s=arc-20260327;
        b=FYWhBc04BN4xzUeV1Gr8Wafj8uAVb7yhP5FldSzyzQX2MSQVuXR4Ci/PMzgHz1WrVI
         /SCd7HUvaQ0AhY5CEG2n1WUmgfNfMlNY1uvsn45RGCHR2Iv3I27nFEZJXYMeaOc1jlqw
         pQ8tEhzH4qCnd7o2+n3Nsz0ycOiz50ITt0KVQEPB44vptel/XbVgojAX95Z43r4iZPIi
         9UByA8Rw+7vIrHK2pm4Oz3KHVVUdZbulTfVU6JKLjwwC5/lUXlNLqZ/iSI0wzKlAhun2
         0Gt8/yw50kII++qp4Pwb5P7df4263Ylr7f7sr7cho1F93NdMqtpj/CI9PQhUqJH/1icN
         h+mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9sp+r2dymTSIz3G/KUyoL3W5ou2ax6jh34iwuHuVsrY=;
        fh=Z0LfITx/HL2F8azthWzK6oPWHtC43dftUO4mJT3vkpM=;
        b=Q45X8/VpUGDHhO6rEh0+AXZmZdzwBfICibUZI+rDQ90SZZNXZhH91I9bvkJv0/GIYx
         dTWeHbNVlwbdbEAtbv1ngyo2EJE2E6dDAOOnco3oLx/XOmXOjr35NRZkd2BbU9zp42JD
         3VGzh58+f0Vpn60RT/FygLfiLnQv3nqECkRsHI+7FM+diE+IJ9cmdRdvpn96+PcmuYVj
         1l8S5lkZPf4tImoSommc7V2IlKEph2eV/Y3P841H55/JL377fg0mVzgRrrwSk+EIAbpM
         difqq8fEOzWREPLWAwyowFeWgimOw5nu1o0aaohQvVB5C/0+lp49ximnukdtfCEliXet
         V2dQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790779283; x=1791384083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9sp+r2dymTSIz3G/KUyoL3W5ou2ax6jh34iwuHuVsrY=;
        b=qpFRu80cziiqvyGeW8LNUP5vevcE3Jkzzo8yaPs/l57QvxDsbZ4u+IYcGgZn3Rme+F
         TnAe7X/WKwb0KAKFQh2iP7+2G21eS2Ab34Mfh71WJRRVzzpCrFxqyQmJGtZYIdvGrQ71
         19Ot334LvbHRH8bZ/lJxzcKgTVvzaQ8JUm7CL/lUr2C0Z3QMVILSvdJinWS/Xyl3eNhh
         2xF0zyCxAJwhwOOL/48I8OdgoVP4YuyEB2qNGQHiqcWZ9Hew6O1Uqe4i2UAQbfduvNVW
         wSHRJvwrs9UiSYn8RbwfzfO9u6OmSwWVXFQutYu6mXPaupo55D/C4Mm8K1BO27iKWP2R
         zzwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790779283; x=1791384083;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9sp+r2dymTSIz3G/KUyoL3W5ou2ax6jh34iwuHuVsrY=;
        b=Fm/FfdkDGBYnVyRIpq5yYrIOSuTV+TEQEjd5aQyO0V9nJjs8ORmochX2jtlsDaYbnD
         DDxpbf8rSrrqNwlGJ4xQQ2aoVUSiT/7qu+YSvsd31QWZrOhL2jxeqqhD5J80NGseRzkm
         eIZlS4zjCWPJVLscEBAl7DqYT+Bd8C/5mAJRAY6oXgyBy2XhiD7RfVOGY4JiLyqEi1rZ
         8hhSwtHCE6rsQCtcPcbnqRlTUrfbzIQefcJVD2+wkNHfgbZBEjH6SUNl94Uyxatz/5+V
         zMWmva6GTqbVaesPm5HOvDZfyRvs0+3EcW2wtmCJPlIb5MxiOcP08UVr/YBY3WCFVU2L
         DjdA==
X-Forwarded-Encrypted: i=1; AKwUvBzBG+1+3YmJT+sMou3I4NcVNkVbTIL6+WK6rYzCb4rCJIh8kJaQ2ZDlTHGIdGo1+CyLbasog6UDqVZ6ownqbQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIpA31B5ZWS+10TPTLk5RdTIr8PyNbqOn3Ot+r3AXtc6t7JeYrv
	wqZzb+vkUsIY6EH4Mow/TlhXhKizRQSNdEr1S1Uj3NA/ACSm7wM3iuwp2fad1o1NBy3Fk+SegQA
	l5HyiSImN+mbwfAe9R/Aw0nJfNc1oqgE=
X-Gm-Gg: AYBFou01uV02hC9RydRjABo4XM7lnR22nB9DuRgceWHnK3PJLEh2KHzuUFUzprj8n7x
	uOxWei6+E4Ava8fcVzh176k9kRvnkEU/xSzI+uMm/V7Kjrnpw8lDvKjQGgQ0qrQdqor7cgnYYxo
	DJjot1aOsFBa0TuJXEvQ3rsp5nfbBtiKZUxTAgDlxf7hQcq8VVeNkQC6g9tx/xEnpwnT2U7wuJH
	CT6FbwDuxtlW4cgCNQrkW9lhL4Gjj/F9PyXZO52Y9WHEhNhosB77D9jSPa43wSWx3q+WPdyact/
	SDaVWpkkHrG/H3uXkiSJZMEa7u5PcaV7fo5x3YS92M/HvOPbRNXRgRnscD+ys1D/ekgOHCxFDpk
	gB5I0PFbAMsgEJQQ/TzrmXD2Bo1iittakIm13LHIgafhdp11OasDu/IARvF9EkvAxW27IabaX8M
	ik1jQ5vEJh3qtgg/TSRugbXiLWaS5c9x6Vjy3BX0toq/qFvGzKSKDAvF35mQPZBA==
X-Received: by 2002:a05:693c:41d0:10b0:34c:15b5:b4e7 with SMTP id
 5a478bee46e88-34cdbcd280emr3610200eec.2.1790779282558; Wed, 30 Sep 2026
 07:41:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-rust_kunit_v4-v1-0-e3b0d45311dd@gmail.com>
In-Reply-To: <20260930-rust_kunit_v4-v1-0-e3b0d45311dd@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Sep 2026 16:41:08 +0200
X-Gm-Features: AclHuK_ynM6whJXw6qHZ7KW0enKmjR2gXUpLMMaayW1XxJgbGhEQ4tEW6NDWhxM
Message-ID: <CANiq72k2RfFBncNBCGGdWFEJ-wWZ1MzA8ErrBDAcAvbGSRaS=Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] rust: kunit: support #[should_panic] and same test
 name with different #[cfg(...)]
To: nico.antinori.7@gmail.com
Cc: Alice Ryhl <aliceryhl@google.com>, Burak Emir <burak.emir@gmail.com>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn1_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Brigham Campbell <me@brighamcampbell.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Jori Koolstra <jkoolstra@xs4all.nl>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Rae Moar <raemoar63@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, Yury Norov <yury.norov@gmail.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 3:23=E2=80=AFPM Nicol=C3=A1s Antinori via B4 Relay
<devnull+nico.antinori.7.gmail.com@kernel.org> wrote:
>
> This patch series intends to implement two features for KUnit tests
> written in Rust. The work is based on a TODO comment made in the
> `bitmap.rs` module [1].

I am glad it worked with `b4`! Hopefully no more Gmail issues :)

(Nit: in cases like this, I would suggest increasing tagging with
RESEND or maybe increasing the version to avoid the same subject line
in Lore and other clients.)

Cheers,
Miguel
