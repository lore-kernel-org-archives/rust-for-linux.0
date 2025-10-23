Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948533090D9
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Oct 2025 09:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761213280; cv=none; b=pLbvkaXrfiVPzPN5iHu6VlGgyV/6l2P6ketvSlPLKyXbc2JdJJ/MBnCIT8jpepKwDrdYV3K4ergQAFwn8Dh183dK591lWhGyU43iRAroDT8YuaHyTH78aIJbYPsT3c1DIsqQuwWDabypu+51CtGG689Ew0EhtPoUG8FJmUkl774=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761213280; c=relaxed/simple;
	bh=8y38CTfP+8bs2zGjp25uWvL+vEiIfP6AVWmvCPg1cVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CvbixCnEtKXCj6estRcyngtQba2KmPVDS28sHyC7IXkFwuvBCUj2BQD/zbS2T0O8FaOI1qJGROAJics92wq6QCv+1+w4XB1evJfmY2H0RgG0ikZ2MdhtWmFT0HJCAF4yMahf3l4wncShfoPD5NVIXROMBn01/Cp36MOYVu2YYy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W693FFUI; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W693FFUI"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-290a33bfea6so960105ad.1
        for <rust-for-linux@vger.kernel.org>; Thu, 23 Oct 2025 02:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761213279; x=1761818079; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8y38CTfP+8bs2zGjp25uWvL+vEiIfP6AVWmvCPg1cVs=;
        b=W693FFUI1FCzqsgDJx9okyc4+mQPp1lIcQbjYYYnmGrKb3XxNkyWND36ZfgXs3UNUo
         RlWBw0zb1IXnkuBrq4aQ8jaSytphWzn6AG00Hi3H5DAHyeTpGsyhXQnNTCCzfF2tB9Lo
         nlQCeOs/A+iw5hLI3akrmbhOYJwoPFwDs1fUo2iSMuQVp1K8ddNHFspoNVJjmRrqp3YL
         jxQ7vYNzVsNlPy3O+3i9Q87nDmFhBbqGR5wi5cgZrLGtxRzwfUc/WKJQ8npE33+p0WYQ
         0yHoXVUeMeeWIteYq6p3ssQp6JoXJlwfFdUtE8AppKKUXZAawA0GKXVzpCBE6R/WX5dX
         HyNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761213279; x=1761818079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8y38CTfP+8bs2zGjp25uWvL+vEiIfP6AVWmvCPg1cVs=;
        b=jZjKg0tPC4zm3UWijbxwU+zxh6OA+qhytAHQfppcVjODZoeYttjmL2m+rM1TfG/G0Z
         /Cg+z2dmwvGqO2LKp+9ZbFN1CisYCJqy5/pqowKepY3p8dKsZr5gMe+kWHxzwdwMY2RV
         DJ90wqW/N1lrzmkrqAjvmR6cGAcJVMF/jL37REKyrYRZDpEiPe1IKL/UW/Bbuw4QdssM
         r0qOYwiOyMDM4s1CbtK2UrfzaKBKda9IDsz1p60tD4N862yU/+0kQF1Iq9MLql38NfLo
         o3IKiIIEQYv4UYwJAPtFpWhx6TXaV1rZ7EkpDmljlsNkTygVG44n+iJHalXfOeJDerDz
         BFnA==
X-Forwarded-Encrypted: i=1; AJvYcCWRlV4s8LKOnX+6IF+e6oY2DA8xtOe+OOQwLYabnhMnTRH8Fvd43Ub633sY4HBzabbNUo4JE5QMiESVQKDhcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxY8V5Gc4nwQmeZAl0+RKCZ0XnTQNwWvAJCKeFYEPi0aFxEaO2Z
	uj3Cyziw3U4SBjN24bG+YmfZRa9bYOo/NdYkgmlcmZJntHzjK4uJRoIBuwoMKZ3pmMiES4lrvTt
	qJPzmdd76vQWbHzgihNp5JuNbuUwVIsg=
X-Gm-Gg: ASbGncvhw6DSMqifJZ0hTmyb+BnCAjSUumgmJ4HImiIQeomwBQidBMi7C/JZJG7S7Tx
	e1ThEoqHPSw6UW75ccS1LG0ZskdfV2yUhl7QVe9pyXILYL1cMX2ZvlV8jsNze9ugw969XHQymjd
	zniS1T29nKEi9E4/Tdb7rEqQT5LgTVKMbRKczKIQvFJvt37R09T7d1NjZctqirTI31Ok5RwKI3/
	c4JVknFj2DudYNYuCyn5pNsjceriF+RgtZ/JQ8Vae5QfArTFq2JGxD2NLcJV3KygXAMZEWAci/g
	URa0vFdNyA99aCyHM0+Y9HjJGgVZcqJTptdJT18Tgk2M4we2x3myYXBBbQBW/mdsiHteBpJP4PY
	NUrYIawB9+ulyqA==
X-Google-Smtp-Source: AGHT+IGzIuFClkjRzQSxWXfGZEcIXJCdcB93tuu+9Aw1VCEyDz/vaHUr/NAB13qNXBZ+vuJxUwwE8kPTIoI9sAd9BTY=
X-Received: by 2002:a17:902:ec82:b0:25c:b66e:9c2a with SMTP id
 d9443c01a7336-290cb757692mr173621745ad.6.1761213278867; Thu, 23 Oct 2025
 02:54:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023061124.2582749-1-fujita.tomonori@gmail.com>
In-Reply-To: <20251023061124.2582749-1-fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 23 Oct 2025 11:54:26 +0200
X-Gm-Features: AWmQ_bkamiJAG-KnAVJQdlAoyXrMlmaL3T5Qv2VUhB08-5-Q4Cp3XmozQWRcVBQ
Message-ID: <CANiq72n6J16yyPdhNAzDn0LXVBeiaZBcka9WztaZhqMF16CY-A@mail.gmail.com>
Subject: Re: [PATCH v1] rust: simplify read_poll_timeout's example code
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: aliceryhl@google.com, dakr@kernel.org, daniel.almeida@collabora.com, 
	ojeda@kernel.org, alex.gaynor@gmail.com, a.hindborg@kernel.org, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	lossin@kernel.org, rust-for-linux@vger.kernel.org, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 8:12=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> - Drop unnecessary Result's '<()>'
> - Use '?' instead of match

This also drops the comment, should it (or part of it) be moved above
the final `Ok(())` or removed like the patch does? (you added it
originally, so I guess you are fine with removing it)

Cheers,
Miguel
