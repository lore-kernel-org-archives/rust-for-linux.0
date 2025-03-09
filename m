Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4339016D9AF
	for <rust-for-linux@vger.kernel.org>; Sun,  9 Mar 2025 19:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741549513; cv=none; b=dvRNNS+SrKC7OyC+ZNU1FE280KgIA11lch6Had6NH+ZnimPl1XjTjq053BUN7UKjNZ8VSIZBYD8nsLSsslCOVIOI2dwbW/uB20rD4ah36p2xUASRiXSPPD1DrExUpJ46KVjUftW++SaJpVTradYUjuqnRikyVYZqZQ0+ktQfYvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741549513; c=relaxed/simple;
	bh=CzXaZPio+kzwaCTxCi+jBr2rEILgDE64S7NG2AOaL6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NSyTP6WV8Goq538xgC4qSBT2mXpW5anoqzzob7sfmFstYJCQcBEZn2doORiacp0ksZ8DkPASMFMUJu/jWsEfbf93q4ykZaSc9yKdxRXzu7sXbN7lwrvYn49nFuLRK158pQvK+xfrOq26D3aD1l+t89xWJuJqC2tqfyafaHo08RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b2OPGchc; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b2OPGchc"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ff62f9b6e4so992270a91.0
        for <rust-for-linux@vger.kernel.org>; Sun, 09 Mar 2025 12:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741549511; x=1742154311; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQOHaF0ZFsZjWY3K6bFGBmftuQtTxLqvOs9Xr1wPAi4=;
        b=b2OPGchcwZl8JiOEBvdDVzDo5GYTDgdwYHetj6giAI6eE7HdEm+a3gWuvwxO7KBo8s
         58pGxAtrwAalGNxVBC/dcPiosZUepFAXD7Bs+HIuROyrMZY58aPJZMOo3svWcVi1jPFS
         Ev5M35swcGA+3GGsWTm054O4N021s/m18reflCy2LLsrwgULeyJ7AUI3kNjVdJ3643p/
         KzEsSCXBcRKXDPvmMEutz2TzcKDLZeSa9HqQBRvN9m4J7ouje3iQz1YBJqd5ObXkOiSx
         wGy6V5l2IMM6+GdxiYUuIq+L6pDCfDa8qVkHLQG5NGA3v3ghKd/iR0Cg3ax48iute6Q9
         o3RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741549511; x=1742154311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jQOHaF0ZFsZjWY3K6bFGBmftuQtTxLqvOs9Xr1wPAi4=;
        b=fQBP4gce/jVgSVCSrgCNsbwIk/l/fXhjTnAXqxTjCod9LyFt6mLzU4Y/tL66LbMwg/
         Yag0VEIOgOIiUxS4eWJjlyWx9fljbhXyBalPq4g0cL20UC0akGQXFJ7MQeoolE22WY1p
         pLJ7UALAt8dw+rR0Ow86p7q60sotsvRtqtsn9Z2JeF+32co/k+nyrWoezUxpa0ADw3h+
         5EUrMMAUFb9uCHLqN/w4hNHS/zjWsnrKdFDtiY9IC4H/Oc3USletT+V6HonX305039/p
         6eG5BNiL8WA8c/u/Lc2kFY0Qg/rHrWvlqO0kch/bmnyagJl4UyDs9qOye0v2VLtow9tS
         V8ag==
X-Gm-Message-State: AOJu0YzpEbRP32BTSu6Goa0NU2mbGsasw3GGAfZrdkx92G/TcZDib7Ch
	L7IAvehs5SWQJ2DYPhy4k6peg1r79+BGDYZetz0EqL3zH5Uq27X99siLZ1z7s6lPYOGenmZekwz
	A1W5NAReLkMLTLO8A6xXwvLtSQ+rfUAdRk3s=
X-Gm-Gg: ASbGnct7KWjhCXIMkfMV51XN+RRuF9/KBIeKZT2DvnDsCiHvJ8uSfZ46sc2ZqeI6CI5
	pPyyzV1Rn0hUOT6LeMsW+gv8ufxcj5KUyOT/KwK3RcMzPdmvDXm5fjJeCZVQpc78GQtx7K6JxUg
	gUmfTxxvMWHWoMnTEneg1q3oSsgg==
X-Google-Smtp-Source: AGHT+IElyDLhWKTy1crQSr2173/nFOCeNbUG7sPDm9jd3dB3uCjKfaLxEgZNlJ8eiGenSIDnHQkkwHuCDm25tHCV7a8=
X-Received: by 2002:a17:90b:3b87:b0:2ff:4a6d:b359 with SMTP id
 98e67ed59e1d1-300a57a5a03mr3609411a91.7.1741549511446; Sun, 09 Mar 2025
 12:45:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115062552.1970768-1-dirk.behme@de.bosch.com>
In-Reply-To: <20250115062552.1970768-1-dirk.behme@de.bosch.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 9 Mar 2025 20:44:58 +0100
X-Gm-Features: AQ5f1JogUWCy45DC-SxnEGv5aZnUYmAb0gwR1_oBRlOm9BA6KsBriwhejaxhXWE
Message-ID: <CANiq72nY6Q8hNNQ2BAgGfWUSFsY66YQak+wZ6kyduUZmXoJC1g@mail.gmail.com>
Subject: Re: [PATCH v2] docs: rust: Add error handling sections
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 7:26=E2=80=AFAM Dirk Behme <dirk.behme@de.bosch.com=
> wrote:
>
> Add error handling sections to the documentation and use it
> to link to the existing code documentation. This will allow
> to extend that documentation, use intra-doc links and test
> the examples.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://lore.kernel.org/rust-for-linux/CANiq72keOdXy0LFKk9SzYWwSjiD=
710v=3DhQO4xi+5E4xNALa6cA@mail.gmail.com/
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>

Applied to `rust-next` -- thanks!

    [ Slightly tweaked wording. - Miguel ]

Cheers,
Miguel
