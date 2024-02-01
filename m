Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FABFEACC
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Feb 2024 02:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706753152; cv=none; b=jAb9PgU+vyGYcQh0ONpjSQHivQsE0Mb4kZugqO6TPVQDIs1LDpwVIG9f6tGOYbYgmGSgzzYCiVmjk/jD89RnXndnAn+DKQnTzWVbiBi3LPsLNOLZ3IexTRkZ/BdET0y3cBc4jcpmgmIFac5nzU4w6fHTI5+ZCItKTBrl6Oe4CS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706753152; c=relaxed/simple;
	bh=GtBgZXdyTVv8lVVNYeMGYCR3v85wIBVYaFfjcHUNpg0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fHu67fS/VKBUPij7Cnj8QTF3TdWxtNFmt0eA5F+VW0izjFIryAMgUvalhoQyfHJ3STnSsNAdf8Lfa5JtGeQnrEh5d4Je4f0VJR+2Rkk2bobjoTZLBom/HBRcx10udrVuc4yz/uU5HUx50dYnd1ZCwlLCM8bURswFyEve3Iy+utA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=ZYBRfWVB; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="ZYBRfWVB"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dc6d8bd618eso175686276.3
        for <rust-for-linux@vger.kernel.org>; Wed, 31 Jan 2024 18:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1706753149; x=1707357949; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtBgZXdyTVv8lVVNYeMGYCR3v85wIBVYaFfjcHUNpg0=;
        b=ZYBRfWVBx9wvjRBRmX3m7u0jXTjNXyjJzd6QUQyJgFCwD2pAwWi2eK4CMgw35Fxx+w
         bHwlSQTiw5GLKYMCSF3RFJLGryf/ny0/t6Q9xja5zTeVcCxRsP+uN62W2wY1bgsks57d
         BL473H2MigVFwIWKpB5S3cIIrBMqlMWgms6GSOw9Rka9XXn7GevVH3iPV+YK6s7JH9E9
         0dwFO22fCOUDERn39+48BlZqVz+1KVJ3OM9nXkHiJw9tpfPTQXyQweM05ne8Sg/ZS/n/
         qaJcId3CY5ZJW4lmap/Z2OpX2vz/Z+7dOLxEe+llDRz2VntKe7RhZZucQzmNGbEbkEix
         7JsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706753149; x=1707357949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GtBgZXdyTVv8lVVNYeMGYCR3v85wIBVYaFfjcHUNpg0=;
        b=DaIQscLBQKchWU9t4hU/gIUlOIbBPb/Bvyo503v+6euIxFHXVfrR4f8mCE4M2meWSt
         bbB1S/0mWaVIQqnSQIxzLnbgdJldOyA4kENHEDEGKo+ccRpCNJMH/R2kIYdHZ3ldYXlG
         hWT1FWe0QErcKR6aSdbiw5WhPRuPu3uoAuqDEK+Y+nFsfCtxiOReiHFewIAhWLBpIfDD
         UIvgtqF/ph9MM40vd/8yrMhsdm1/5ZqV00EN63U+Fz+5zko/qkzO5usQlpEvKm8WJ8D/
         swxokNnjxWHnjVEFLnHjhYaqtw4d8oLl6txp4hjziV9SoIGux7iXB28rBqPGsmUboAWu
         nU8w==
X-Gm-Message-State: AOJu0Yx8iffbEiSH4QlqY7eO3yqQg6PPuPvmwDML1wKC5SbV/nxCh9kn
	brYEG/dimLp1bHzzHcvwlv8JZyQ/dmBFQXv8UF0+pOaXMOkc1hkhn0BL64SO0/97u5rFm8Yj5jo
	pGDSoOb9s+OVqNSfohT50RE1vrk6p2DTqyoo/Xw==
X-Google-Smtp-Source: AGHT+IFueYMK1otbN1PufX1CC7qq1mb6PqyiZYsq8OuHiP85BQ/vM50x0z/7gd6dg9lojcXOHpsotfWWK1+yLjqeAng=
X-Received: by 2002:a25:949:0:b0:dc2:4041:79a1 with SMTP id
 u9-20020a250949000000b00dc2404179a1mr3547303ybm.16.1706753148903; Wed, 31 Jan
 2024 18:05:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130075117.4137360-1-dirk.behme@de.bosch.com> <20240130075117.4137360-2-dirk.behme@de.bosch.com>
In-Reply-To: <20240130075117.4137360-2-dirk.behme@de.bosch.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Wed, 31 Jan 2024 21:05:38 -0500
Message-ID: <CALNs47vHCYeR4kPiY4985_EyfebNOr=ZO36JvAHd5h5E=yGcbA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] docs: rust: Add description of Rust documentation
 test as KUnit ones
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org, David Gow <davidgow@google.com>, 
	Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 2:51=E2=80=AFAM Dirk Behme <dirk.behme@de.bosch.com=
> wrote:
>
> Rust documentation tests are automatically converted into KUnit
> tests. The commit adding this feature
>
> commit a66d733da801 ("rust: support running Rust documentation tests as K=
Unit ones")
>
> from Miguel has a very nice commit message with a lot details
> for this. To not 'hide' that just in a commit message, pick the main
> parts of it and add it to the documentation. And add a short info
> how to enable this. While adding this, improve the structure of
> the sections.
>
> Reviewed-by: David Gow <davidgow@google.com>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Co-developed-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> ---

This looks good to me, thanks for the improvement.

Reviewed-by: Trevor Gross <tmgross@umich.edu>
