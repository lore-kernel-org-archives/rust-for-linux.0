Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57CD2DEA6B
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Jan 2026 15:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769699592; cv=pass; b=pCzcmJyN/utojJKbgRQGxtdd9GW0VAGae0OkIeGT4B05+XfM85Bn6NxgOaBOG0Ql0FQlttIjREdIJPlp+2xzWSa00ZsIOqsJKtGWiyIuOMCDkaTKEZXMMVeRgzG9stOB/pFeDZQNp+rZm5idY52ryUxeLI/HFvfUgaHPNvN47h0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769699592; c=relaxed/simple;
	bh=N1cKSGn5P4p6e78z6yvKpG0p+ubfA7RZg6/t72jhG9s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H1G3eYSUYdRwO58tlm0h0VPBDyz2n6bxSK00ghMaqQQ9bbyjXJgclL23u9UVR2H/ixP9CLv7mcJ+2fOFmZGlluYdYvFkUVFn2ngMkQWWQ+umI3mt0eKQkjMDqIxlq2PACWh331wKnR7X9vEQI1eeUHg61BzjTttLmE7y/oN9slg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H61SBO/t; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H61SBO/t"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2ae5283dae8so114995eec.2
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Jan 2026 07:13:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769699590; cv=none;
        d=google.com; s=arc-20240605;
        b=BTUxWcNvo0u84MIcIPC3atBDvcZGFFY4EgFoFW06RjdqrFH6NCEb1BZehSWSO8dDeQ
         x6gvpUBio/Nh1Dd6/SMtsk3DWL3mkdt+RMybgQNMH7W934jv9HuepX0JE9hMLMJKMYW/
         j9DDUaEnHq9veCjz4c0ZXa05ZXqA56HhqlWtz9S05bi+RxOggkgsVJ3YDo4HICSSiQ+q
         CHouTleT+2Mm+PLszcyy+hJyaTDLWfgFdDjYBEJcA3wYXt1StPBLMKOZMjK0fAsI43Yq
         b2FLw1IR9xqESFHZzlEq4dNx5cww9nj0RQyWT6UPzpcJ088ol65CbWTPBKRxVbpdgj3x
         X9Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aG3XTbdzzPqH6lQsiaX8E5tJQyrpoeRTwjyZgnS+QH4=;
        fh=4SMDCrswExDZHGbkxkk/MhVz2pKs7e6XfNnq2hLdDXQ=;
        b=KBUwtorSEwjt6ijVDgDAJsm0xRCKIaIOwwPj8ArGNOxUP9z/oY9Mg8GvACWqATNHo5
         ITad2QH3hgAwabyQRvlrotpjhwwH4J/KfggVe2YDQFNz8P06npn5ZnrajUCVgdICiSRC
         2X+VFWr3vL+uxdEUuDLVVOAOtnm8dSr0rU3xs7857wR3xPmuvxKqQ0TRKSGNnoKGtPqH
         vT/w2vB5C7izHKhSy7ldMLyXe+Qm4tOSfXmFw+c6l8rCo4C9leByVMyNv++0knCKdfD1
         8Qlc0Z8Yw7tbUQ4nB9puQqx5D+47SFAQjlEfSiYlKPYtMtRyDYhvWFkEkSwD5Usbrsju
         vnBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769699590; x=1770304390; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aG3XTbdzzPqH6lQsiaX8E5tJQyrpoeRTwjyZgnS+QH4=;
        b=H61SBO/tR8vBw58deUAI+8VaHb7fe01QXNO+Ihw9IbnWYxCnkWvHTWlsdzy9gZXyfE
         AeSOZmnng9oJE7mJ0MUzmASmKF/VcQIWrel3UIkdks/GaTJeaUKT27sxhV1PEfgBgfcJ
         02cTHH56CZ4oUk6wERMh9gTlIY34pGdBJTSgVm/G/bih2BI1hdRklvdOWSaTX/Ma12Sg
         fF8QVguDkN59c/72pkWDA+UwcUE0eCHSFZu/LUYAVfPclsRe43pS5XM8/rBn+zuNRK3Y
         DTYCQQ3ii5WxUfPY7yFMsaUFwmpufPXPrwd5R4zDhVgpoCo1inh8jx6qCFdrqB2Y4dJQ
         mTCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769699590; x=1770304390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aG3XTbdzzPqH6lQsiaX8E5tJQyrpoeRTwjyZgnS+QH4=;
        b=M/D32J6k6KqfQtBpkhVwnveo4nsh7HbrJvw6qEggsWYQddXRFIEr8AZFIW4zuFzf55
         wHtYM65qOdUyhVu/mUW4TWuekBbfUL3Ku+rAn2w5DkhEfAQYiwG6gS+lguAnqa/PnyyQ
         MjGTIc6txXqHhUroe7UbVAVaGkACb0UqCM1dYN3FipoY5munfoK49sBkjHwh1W05XJwR
         GyZckphntBsUHAZPzN8XEkply5OElRarC7R+am54gJqeL/ogp9lMDwdYrwKQI1LNKWWw
         pwURfPrWKUmykLA+kXSEuK7u7mrhKjiJeZdHjYLJ24f11QhA9goseNGajRKDHdrK1Omf
         /7eA==
X-Forwarded-Encrypted: i=1; AJvYcCXWFeKoS+ML3A6qOLuZhZUMUxxzIc1U6x6gsgIpG/KqwSuJXfr0DgokDrp9SCadJ0SCmKy66lDXcShSepfCrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnUcaUzmVP47NK+Rm0Vq/kwGtyJ4tc+rBVZcWLeGPPS6OxWre0
	iFA5eG1UN5tqhKGOy9IesD8xBNghIw/V9VuaafiTJ/oFvUWQLTmcXpWJElCxKXqWpC3AMEcDqfy
	omVfJtq0YvOCK7RSOkl0FB3H6TqHbKlw=
X-Gm-Gg: AZuq6aLlJ6apoOcc4a+X9QhkT7Z8GShoksK19jGE7XaG8rhkU8tHar/vj5dEfX+zaLt
	kIgWWUKKpC+U1yhr0pKSwxbcyrm7Gim21N8JYVfs73nQYyWBXhdFN6lo+xFy6m3T+YKBRT+nFWx
	Xqh4hMJZ5GVwLLPinGierSVC+2SG6bRupaer+R01TZCMtmnLQquj5CYdNuiNk8G+vzOZxm9o02q
	gH3YVsMhJ7UyhOJm89/o0VlaKFmGXzO4QMN33aEdYs3Ih4/5kfCdxzOzwcG2my1n8FgtkMlsmRJ
	8HdGT5r1qZ4ZvEIGeIdGSfbb2QHnUZHEEND7NP92C3mV16EVQsCoGSEXjIFUi+RiSoRXX8kHeRg
	IyeLnUBVJRiP0
X-Received: by 2002:a05:7300:fb94:b0:2b7:3835:21f0 with SMTP id
 5a478bee46e88-2b7af670f52mr1104369eec.2.1769699589805; Thu, 29 Jan 2026
 07:13:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aXgpKOHAmvZuMVSt@yury> <1C5C477A-2CE8-4B25-B968-416B89EA617A@nvidia.com>
 <aXhD4sI6MHdAvgNT@yury> <DFZB4ID2H1D6.2ES3VEZQEGEQO@nvidia.com>
 <aXmeR2ocKm-xPM-w@yury> <DG0A8B4DUBDB.2NT25Q8SZOHT7@nvidia.com>
 <aXpP2l9Gr0XOfSEn@yury> <DG146R3XWKZK.2ECB220V56ORS@nvidia.com>
In-Reply-To: <DG146R3XWKZK.2ECB220V56ORS@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 29 Jan 2026 16:12:54 +0100
X-Gm-Features: AZwV_QhSn6v3tIfs_iuP8I3dwZpB7rEOE8iwt0lLVTBSlHSofMlU_jdp5jPKt5g
Message-ID: <CANiq72kj_+uG-63-kd4eAJ2M-3GONHBy2s+fSUaz+aA8Pct-RQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] rust: add `bitfield!` macro
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Yury Norov <ynorov@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Yury Norov <yury.norov@gmail.com>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Dirk Behme <dirk.behme@de.bosch.com>, 
	Steven Price <steven.price@arm.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2026 at 2:41=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> But not doable unfortunately, since macros cannot be declared as
> methods.

Indeed -- it may be doable in the future with postfix macros if they land:

  https://github.com/rust-lang/rfcs/pull/2442

(The proposed ones do not do type-based dispatch).

Cheers,
Miguel
