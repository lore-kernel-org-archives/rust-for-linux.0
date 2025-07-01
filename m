Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7187627A465
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Jul 2025 11:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370601; cv=none; b=OYHcmM8bxzi6F/wQYx+a1UEsppj91pvJxZwpOTMdhMk1AcgEnRS5yABYFN+h7VYNkgMjkjK8vQXAflfH/Yr+YxkAIXkUxES25T60AX01jKeBXYT3goADI7EXsSQHT2nsvl2TET0hb/uZ9rAz9Ymv7HesUszxHue89On6QE57k68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370601; c=relaxed/simple;
	bh=R+rwOhIowzKwTY9h4u5eqn86gDd48p2rdXWg3ykB4X0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lYCy0SnMmd/2pd8Ba0tyIIqoYNupnQ7+s9O+M5Vc2YoGPXSyWGNlTPns94tl3HAw956lMi4iEheR1ZM7jyr7o9QEtTDfoe1DckgC5ykNCkEEx/RpGVO0Bd+bfw6pmnFvxbkVxxjcxgRHiVl/taxrQt/hQTn0wycB0Ti384/Iy3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0JUONJrG; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0JUONJrG"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a50956e5d3so4717495f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 01 Jul 2025 04:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751370598; x=1751975398; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0KGSBavzhT3TpQui0uI73A+Z+3UDA0xLLxmDbt54UW0=;
        b=0JUONJrGzkaw1i/zUiw+03ML/aAkfY8AGX628MberDpxPEpBMbOcvlBo2B37+WvDjE
         KdmyhJruSd1D+AMUAahBFaAcxNFpYddVLdNYsz9zqcbF5HQx8hzudHvVAwOrVZnn44Vr
         1vmmX7WWsiTNf35fnB9i4tmZezAuKiC6Ryepj/79CeQk5HetymnC7+rHM3ZXAzfOW2jd
         svPMSuF84qClbkXmj3fwCLAdmCa5zA9HRvWVCyjCMTTvGTosPu+83DpVXFcLCd8TsJpq
         JAUr5u4dpiiKRfHT/r36SG1d7jrKtfVxzIm/SHQSc+NM8xsrHo/nrH7WXRZQI0k7Ml43
         Fphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370598; x=1751975398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0KGSBavzhT3TpQui0uI73A+Z+3UDA0xLLxmDbt54UW0=;
        b=vrBd83ex3I3BJ9E1iUAoBW9Y/ZwEkFvhgP77nGnF+0m4UGNBXDWnKnIXTQ2x+I6iRN
         hIrP3V14qHxONtB4bseufakiKr4Re8rluXy5xIE9s/i6zfcs6iqsHLj/xjoBDIRjXRw+
         LU0CHd/vkoOGZ1Pscph2Yv0ofW3g3psOvB18b+BeMOA1WGArYfbx2wvwyuPT2c47ZbEd
         S7YDqqefQD8T0hqYY38MK7j78W8KJsk8JqKeNuH2qfzSuYXQB0Aoc/nKV6C/GHuM4SiD
         mSQVl4gPFK13m89QC9HcyB3UxExxlOri8da7tiRjI1e5O2RzsrZDa452hdhY8pK4y9FH
         IjWA==
X-Forwarded-Encrypted: i=1; AJvYcCXgUnP0HG4O2+1LO2Tm9r7fuSdqDXJjP1LrPhaMYpOQPN3YFaAjv4HmwxfHfHsDb28ub3WCl63T79vsUiDRIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjZBEqcI1muNMx0AKKZqzwAk7ZtWiOZeicJouH2n6heFeH7zyj
	uSuh32h6uf5m9+EXjUf0jvUrLM3T+tgHoQfS0vaWDBO/1VfX/cVbYY53d+Q4p5MqofzDSUt/xc3
	ir7igTjnTBJSh4W3iidpBjzd8gUsXSNECuKFziyp3
X-Gm-Gg: ASbGncvEykCNl2D2mrwXjdE3xi0WnNa1xWJAE+ObhOzq7yiFVPZm7NXYQHH9qetUHT5
	68Z4Y9iSqoxmaQ4mImGQvsTrBqSO+itedHOVIqRWl31mbIjpnik347H229dxDbkdecFgYDTksJ5
	8T1yOyCNDMgiy+PGdN0tfdyK62u4seFu/hq/NQ0GryrypY
X-Google-Smtp-Source: AGHT+IGZXsC8mGRscscDusoREbjL9I6GGdeiYS8C2b53bnLNCJ1i8gfIkCUFcIsBDQNQAE78Y338ALuI+8cM8titd0w=
X-Received: by 2002:adf:c084:0:b0:3a4:f9e7:2796 with SMTP id
 ffacd0b85a97d-3a9176038c6mr11687442f8f.35.1751370597647; Tue, 01 Jul 2025
 04:49:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250626200054.243480-1-dakr@kernel.org> <20250626200054.243480-5-dakr@kernel.org>
In-Reply-To: <20250626200054.243480-5-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 1 Jul 2025 13:49:45 +0200
X-Gm-Features: Ac12FXwadsx85yoxejxv-zSg2WaTwJMeTKN6Q-FEKtOdJN3NxG-K0L-aW-nbazs
Message-ID: <CAH5fLghrF84T2V_0yckusmpBEdPgS2YPRDLw9iww9rAY3_qqCg@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] rust: types: ForeignOwnable: Add type Target
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, david.m.ertman@intel.com, ira.weiny@intel.com, 
	leon@kernel.org, kwilczynski@kernel.org, bhelgaas@google.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 10:01=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> ForeignOwnable::Target defines the payload data of a ForeignOwnable. For
> Arc<T> for instance, ForeignOwnable::Target would just be T.
>
> This is useful for cases where a trait bound is required on the target
> type of the ForeignOwnable. For instance:
>
>         fn example<P>(data: P)
>            where
>               P: ForeignOwnable,
>               P::Target: MyTrait,
>         {}
>
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

I am skeptical about this patch. I think that most of the time, you
should just place the trait bound on `P` instead of having a Target
type like this.

Alice
