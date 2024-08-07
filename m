Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B4D1E7A4A
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Aug 2024 13:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723038888; cv=none; b=dnQj+aq25ek4aEyUte3ZsZiJdkom7Xj0B6m80/lWh3NPjNyrLXJrvpqmOVc4BDTQQ7rAWMwwwDFuEhMCfzIyk9MQc1C8S6+rRU7SJOGyyyvdDA04qQ1o/TSWcP5yYUMOJjI5Qtaby4Dotclec4nAGSYiao37wilkh5KghwdUMlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723038888; c=relaxed/simple;
	bh=CgmnfB3mWLziShMAi83wsGO/5ejiIJlJOHgbE949Z2A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S/IWlAm3F51nGolO8pE/tTK072x78RvPQtmLl3pUtH5mLZXFASEO7Wmr69mKr4McKlz9t9XXdSpop2xMj/D6mW2ERsK82PJBvhgZh5RE22vHnaz5+IPTdCbZkmyLnhxziRK2swnxvlO3wigaku68zBdINzdAsYKUKiBiK36YCwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YmrYqGA8; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YmrYqGA8"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3684407b2deso957504f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Aug 2024 06:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723038884; x=1723643684; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CgmnfB3mWLziShMAi83wsGO/5ejiIJlJOHgbE949Z2A=;
        b=YmrYqGA81oa1dc9e0WMflxzo5//5XPJkFZYXWA9OngukW8mMy9N40kLA7uV6fA0G3n
         Rb1f62oCmtPGcu30SmO/Yp0rjcxGMJ/h8LtOcXCoa0pcVl9Rs2JsNyQxlePG0RXaCB/d
         nMBCeoC5e+V+w56h+g2m66Y1K+wSwxZDQiH1/nTIPxRsVC3RwGH73+YhWbDIX0LPgvzQ
         q3rFaznvK9sNJ6LL+UGYvFPbxlgTU1fPyP4oHomksvW86gW7os5FjHe6rMW7ELoaepyK
         ZRiFRq2AuaaKuQSqasDiFxshKFpNspvYDt8j2fFr8sKHn/qK8CzypK6mL/2k/DACrHjl
         YoQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723038884; x=1723643684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CgmnfB3mWLziShMAi83wsGO/5ejiIJlJOHgbE949Z2A=;
        b=Ws6743xuO5IvDbT7u2QbNO+sLbCoJEDMRjeTwnjiK5PDYWLgxbVOciZNuMqCRs0whJ
         3y8pWbEFbTWldJkvISxo+FCZR8lQDGorPmTh08q4jNkpdEzyG75m6cEjqpZo0Y/yw+vl
         ZdMGpfxxJufycNyGA4Xsg2jjqq9npZ96eCPeQfFGmILLP0JCOgGVPWSeH31mU1PjloTq
         mgqdB2ALjMyK5ubjqaJqVn0jAJ9VsqgTkCJdoV4mV+1CikmOpY8korlHCRFn+xjyMrWy
         NVUiF7JQxi2PboqijwrVZUGzOPfVwkhS5xnr25ixpNueci9BcXVYGBUfB2/rfhJwZIQp
         /+Uw==
X-Forwarded-Encrypted: i=1; AJvYcCURXbBcfPfohED5XHAhfpX8iyitdytrEih/0LMCPfDeQoMwAW4mVR9GDjpWLvGA3elVhoUxjfE+a/uYqlPIfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDqjfsNxeJd7c+qojJOvcDQzIju8H+F8Kc5N7CVbPmWnK/6JP8
	KRHW1cazfF74f3k8kCNTeIg8bkK5Xhv7+L9K2oxYuuyFMZVUMT3uaOiqyHX8hj21Do+v4+/ft1d
	gN5NAH17V4Olq79dTIWxvWp9EUIJ9XfsniTPH
X-Google-Smtp-Source: AGHT+IEPlOmydPwP3CcPziVjn8Xw9LixoTxJsrlswtmqT0DuS/DtdRVWISwRJsDL3PA9QKl8VQdMX/wMmnLB1oLuWQ8=
X-Received: by 2002:adf:f14b:0:b0:368:5bb4:169b with SMTP id
 ffacd0b85a97d-36bbc0aeb7bmr11740831f8f.4.1723038883762; Wed, 07 Aug 2024
 06:54:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240805152004.5039-1-dakr@kernel.org> <20240805152004.5039-24-dakr@kernel.org>
In-Reply-To: <20240805152004.5039-24-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 7 Aug 2024 15:54:32 +0200
Message-ID: <CAH5fLggdqpQcr5Sngh0OVwnA1AB4n9cY-vpRnCArj=wXu87bUA@mail.gmail.com>
Subject: Re: [PATCH v4 23/28] rust: error: check for config `test` in `Error::name`
To: Danilo Krummrich <dakr@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, akpm@linux-foundation.org, 
	daniel.almeida@collabora.com, faith.ekstrand@collabora.com, 
	boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, 
	zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, 
	airlied@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 5:22=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> Additional to `testlib` also check for `test` in `Error::name`. This is
> required by a subsequent patch that (indirectly) uses `=C3=88rror` in tes=
t

That's a weird E.

> cases.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
