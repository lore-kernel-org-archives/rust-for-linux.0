Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795172078;
	b=HydlfmU/tXa7chkjnKrNl/Ih4W1uzB9PHeRRUcN/z71VKTrN40QU5UpzSrK1Tdf/MQmJ
	 MIdFjffajH17d7ziL+YUjYI4l7fjY9HnHdw6Wyf+TWI0CGh0P/bhOGkL/Zht5zEfzMA8B
	 11JeqGNaZjiRTO8u30yv09ZR+fuvc3ZQkwd+KzlSeNKHoqa1vKrHnETp8dLfuRCBsRNpX
	 jSIHd+Bv0xMCSmgZsG67HbcDqjHfddzWLDCX4n2hePLMfXYEbb2Ih5CEiBJguSspyUYcQ
	 JwxyrYxz5UrZPFH/6zjBhACnZ+MTHdFe7eRYYcZOLeJFC4/DJav/zvOlN8Xp8GV2ukQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vievxvMoQb39fU5dw8Ha4cqfcWmcBRrBY8uU/a8nTv8=;
	b=Y4ECypAuJo81UVhDHxCrm9/uAMF/vCrT91+bOmtUo3kLxkwf7hrDUQ0TLHarEiRo9BQw
	 OvOxgbgkmHp7hfm/9EMSgl5EBD8zcRWv1Nho3gnbddWs/DpItHy1zKN0CjiAQy0En6xWr
	 B1DJbGK8SQPgPSAEba/eQm+cRenXEYMYd/G/mOC5zoFnD8GcJKBVUji0wozisgpRQ/Si9
	 Br9TV5ENtBHVrwpQTp0YSN7WbSjh15wq5prcdQIRycx6sxn+6i40AIcFu9augdS+N6WCC
	 TdguBShF9KLQ8atkAgX7qzF3eYkbtGLEOJLUctsT6nNpIIBQbrzWstwvhLg7IQ935zw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0UEud1jD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4A9606A320
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Nov 2026 10:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A4A9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0UEud1jD
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c1acfdb638so58037e87.1
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Nov 2026 02:54:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795172076; cv=none;
        d=google.com; s=arc-20260327;
        b=kXsER+MXWyAofjQIjnnRTj5KPR79FrhrIVtWDY1BB86AOk68xjG0bN1ryUd5Rukqhz
         FLnmHqmwR1vRAR0d1q0nBDFXEWwT1vJxi88TAerSwYGYKxUl4+FctCGh2sVxP2jhAJXO
         nkZ3hHI8xjPY3gDuzyK1pqiPmykrq/vMs3/5WajZzlofAVx7J/qDzNrpRjP5R1Gv4s3T
         nNkA7HzurWHtYC4krtJO2CV2sxrhk0npjj4TRIttYSkrlYxAHu5p/ylpvLM7SjLV7ixO
         1gPQubVK8E74XgVxUIikimixgHp+HMbU3TIMzSz8U37bn8r5TszmEScKr5cA5Yx7lD9c
         mpeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vievxvMoQb39fU5dw8Ha4cqfcWmcBRrBY8uU/a8nTv8=;
        fh=+s4XiFeJdYeab+WHfj6XxM4P2J3ge0St4pV/B5XJxkM=;
        b=eJvJ37Pi9GtTWE+ly7iS51UEhAOT3jj/fBMxfijaSrxJSkslbzU/+dc1QFgfl0rGqL
         PDQyyyzTtLG4OuKs1dUsPmWf8Jmtd9lUXgNn4x9EYylPBg12UQzGIrAd63Hsntwfsrz4
         eK0adWE94eODJI4cUbLYNfRu4rKKqG6Fh1RNC00FrGhK3KcrV1/J8xSSWUi4CIejugbm
         CCQ8ow5UEKFlXsgJg+1VLrMwe/P/WeqVM4YmCUz8eTZKJBwj8bHy+W4ut9ObED7eo7b2
         9+Rz7J50vBPlzdDyzw/cJDcj4OXwiej8A21SQrBlu58DsVsj54VpjufmADLqG7rBCg5p
         LNdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795172076; x=1795776876; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vievxvMoQb39fU5dw8Ha4cqfcWmcBRrBY8uU/a8nTv8=;
        b=0UEud1jDAtrXqXMnao0nt1jnV/dRJKBl7/ekCbUgqnIi7knC0s/t5eFpTT7F0Ih6XG
         wZibq+ywE/LnUVy5f4ZuLoqlYExV23QknUdG6oYWUJ487ok/I/hPAtGiRfFVvP5EIf9k
         19oa4WJ1XvBKkFA5i245ipdzn5aCiS5zBfZsLy3WVgbUVuZP/i8ieWV+3wBkHrHAndnH
         XGyMeW17cvLo5Tlg3Px3LfO9ydRxvb4fBepjojHaZdh6R/hC1/+mNt2JzJD8MHKwzf1A
         mDPW31MHSRgi0+nKsq5CgzvQnnquWow2ENQBttC7q1OjxRNcQg3N0QoAnwvfGal1+w3X
         oGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172076; x=1795776876;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vievxvMoQb39fU5dw8Ha4cqfcWmcBRrBY8uU/a8nTv8=;
        b=LmP6JhRevmfCeIs7GlzgebBxmMOA/qdDKU+wU9H7K6ptY2ULI3G3Brzg7Z6CxbklvY
         1ksnhXV+aZy5TjEkv+/omAoE8WwCeamWRtFKW5IWuXfqwowIx7j/oOj6vUfOKSTNHlv7
         Kda+7pz+3YCSJRmkERvkv1JNjFKCjDEwLpIdFCJatfnrDGPbHfnMqhc1luQe+EeMIFiT
         yqAQeI0rCQkAc0lPBcsGh28f9nTn6GAIgswnYQBiMj/lDv7+DgTyGgc9XHy4tLWYHii4
         nvglM9DUKXjMxq6/wy48lkhDgOEEd3x1Qd34R903wZPBA6Arp0S96GDkHPpWOg/mOP1S
         INOw==
X-Forwarded-Encrypted: i=1; AL+hErHMmD/I3LX0Jd5WUmr2zZ4/FmYhYaaR522BH9qJPJ5WaUdt8op91uVAKtTJWMvi8z2f1rAGvfrytDgRTT7hzQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+AVueMhIAOowSOV9nEls5ewyWYQg7bmfnlIsVQKgE5d+1r0wNQ
	CKYTZ0m0msmbkjlo4nZp8kfHTx/qklLHzad0Cjeq0JsSxMcQ55mKz0EfLuSO6HEqUQ0kqsByJk9
	Mv6VR7Ql902PmQXTRHS+JJvP94sBzhQM=
X-Gm-Gg: AZFdTZe4ZaepJKl/kWJT30tkReIrXXxjIiidaDgjBB4f1IUxtiCPC5J5bsWVJkwpsLG
	Q5NM0DfO32K97KRMfcjtixlY4zA8DNzRBZGGXlfGhE6fLeY7PQKKzIlBtdTkUYfoGrgWs/vtB7t
	/dk7OMOeA8M4msLhbgCTMSFdCwalPZGKjbhI/eUU9b/chtwLBginsbBL6q3p/Y4iQ/q0l4e5RXk
	esehL+oS010hsJecVYFURG2rTlFoy2fzFbXKDXP/vS5f+e62ppaHcqFD2A5gPXaUHW1Pslhns9p
	aWAtU3Tg5n4ZygO/7Ag/OqIDO+078ix0sMcKRx41T96/1q5h2ULeaiobpwhvywiEXf4xAWSeDoE
	BFUk08IN5nvWWMYEHePH0B8s5go1yupSwX1sB3AHJiprCMbaDTpJRulUNCqHMcqx+AjFXNY1qka
	ghMTGtw+ckNKIHWq3QepOuTm3liMpacKgo/P4Nbt87rgmuZBIYJ4dMQPRhRm8dMeIQf2qXOMJOB
	rZh0IHbsTwh6cAEIHo4wlmq7MHtC/jwa15ql2ySqcR6WfAK9vcZ6BTkmu+Uic3eV9fLNmQ7
X-Received: by 2002:a05:6512:6812:b0:5c1:5703:46ed with SMTP id
 2adb3069b0e04-5c1bc89ca10mr714804e87.6.1795172075335; Fri, 20 Nov 2026
 02:54:35 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-b4-gpu_info_intobytes-v5-0-3e0c7c93223c@collabora.com> <20261020-b4-gpu_info_intobytes-v5-1-3e0c7c93223c@collabora.com>
In-Reply-To: <20261020-b4-gpu_info_intobytes-v5-1-3e0c7c93223c@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Nov 2026 11:54:23 +0100
X-Gm-Features: Aa3M54o513_u4OJXnC_4PJiTfbRDccCUiJK3hUcQFc9fkLbXWHCQET8-3sinerE
Message-ID: <CANiq72nX+94ie+0RjysjKT+FSoTH0TvWUCOciPObvnrkrnH-eA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] rust: add zerocopy to bindings and uapi
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jesung Yang <y.j3ms.n@gmail.com>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 1:48=E2=80=AFAM Deborah Brouwer
<deborah.brouwer@collabora.com> wrote:
>
> Make the zerocopy and zerocopy_derive crates available to use when
> building the bindings and uapi crates and their tests. Also make the
> zerocopy and zerocopy_derive crates available to rust-analyzer when it
> runs on the bindings and uapi crates.
>
> This will be used by the Tyr driver that needs the traits IntoBytes and
> Immutable to safely copy the struct byte-for-byte to userspace.
>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Looks fine, please feel free to take it through your tree:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
