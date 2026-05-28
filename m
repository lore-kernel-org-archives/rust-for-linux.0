Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4E938E13F
	for <rust-for-linux@vger.kernel.org>; Thu, 28 May 2026 09:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779958812; cv=pass; b=XrbM/MKfX9uPCufXaOkEIetGzLDVyzrniOs2Ebi3XD63qdogam2pdE7Sy//Dz487EALivlD3sqJul03VNFMe33AIKwjmhEBIQrj5+iZfKTeQJ7wtWf8ifE9oQP7kwfAYjC3HbUBJNCUSMUrn7z88uJciFrcDUio+E+y5wz12rno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779958812; c=relaxed/simple;
	bh=aU0+q6h26r4FXAQRht1lGE7YioQhwfVcHJLUY17MEMk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pxJ9tuZZ5GhY+7dbgMlLWvfMYc5ro0jB1Ah45HXtXnxCE1OEouqBCYRoj0urzR7vdKpSa/flfB6Cpow9xDDx28t5V47y9ezzx0vPMnLrzBXuZy1sEYdhXJvNNjRvlu1tMeNc1eCBQRSRruL//SrW71s2cLn+ffBltgZlqn1vrns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zlb24LsB; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zlb24LsB"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-304bd9117f8so130630eec.1
        for <rust-for-linux@vger.kernel.org>; Thu, 28 May 2026 02:00:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779958810; cv=none;
        d=google.com; s=arc-20240605;
        b=SOUKkrQLrDaXT1058ojBLMeIbCN7bQw2maJfx5UFjRDi+WQLgOMt6Dd8qqD4ZQX7L8
         mI4MsUof/QerK0H9SkIQHj6R31jgQCL6tW91aqmIqn9UH8SBhmA2muGeSC4pj4sAVuKj
         2lkokTRiBzunn0vXyGIL3VlYAXjsgDsiO064koYRQVkUqnlDlL5DYYh3zXM1nKJuiiYR
         8yoZzWo6ZCszD+fYo4SplTtcVN3Ag9yn283Y5fjecaiovvXGCKtAmoqlH4zY4cp1Q8WL
         w2/SZlQ5nF3SVrzCC0XPOhkiaeLdlbDqsDCHie2wVC+RBKJsjor3KiN3XaRs6WW5kGgq
         788w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aU0+q6h26r4FXAQRht1lGE7YioQhwfVcHJLUY17MEMk=;
        fh=FbyWap2fnGo12/DisDuZsqGo9bKbdC0cxiy/fVygsqQ=;
        b=gVg9Iy5BvA0B6+vhV8uT8f0X6d17vGgbEVHu/e0xH/QkhkY7SAQOUXewZItnAJpPJ5
         S+V7CUje4QEp6dyl8b2aDIr1STuZB9MXd7DObDA1EqPebpavdLxqVSV9m24OSIjgSXIJ
         gHg8mtF22qnt88tfG7hndhrFSSytyeMC2Z4Z39VD8xdaq/A6jj9atRhKYGQiHfIhoSq8
         mlH1LpkOsa10fEhP0eGl1LR+DtMNGH1cjbfMdBgQVXW18zuDTaV852QFp04vIy3KnbXL
         xUwLl8uBuzv/F6TD8BaOn6UINQAMdUxReMDmZlEW1iwkZKwonzmMAKkqhvxkxNZEDQte
         cTow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779958810; x=1780563610; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aU0+q6h26r4FXAQRht1lGE7YioQhwfVcHJLUY17MEMk=;
        b=Zlb24LsByV9ad4FXRWmGHURwYDeT7RZgzk65PAXxNAJ1sN9qGBiYnFkEQQdBo5aIdW
         hWjA1xATAf6SkVGBwB8EgG0BFruXdJ8/fHAAtg1k9RS3KEqEsR9zGFWl23qkwaGa1lPx
         dBXB4GXHsBC6jJo8RiE+ekepQsp6wkSPuks4DJaiMyvA12NWmOzVDyke5jT6i5SON9+g
         gInWpDOOpKLPftPBP7o7JD8wmnzKMvMus6WZnf4/MZlRx/LzyRBMfodao6pW3pSrIsYu
         OKvAZf05gVI0xx/SlPcFefS6q+KdtD9Lqrq5jQRPodVmRED4ZLhLPJyB0LEfDstCNwpI
         7AyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779958810; x=1780563610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aU0+q6h26r4FXAQRht1lGE7YioQhwfVcHJLUY17MEMk=;
        b=mMbMSzTtf8phXe0RUIPVhP4F66iazVkjDC2ArbPX/p2xsSf69+d2JRNNSKhyLN50Xj
         Uz4gHWumg4HPTdNsDevcHaMNmAzwx95Sq7IND/kXhsi+Jo286zxJdou1JsbrOnIfWPJZ
         FHyXxpNp2F3F3zGh48d3sLYJNKVS3lww5smC9+Ks1/Tb4jjan2dVwnWEr4K06pkfHYDV
         YmPdATaX/PMF54o8L6+S/N5kR22HjF6NawEpFc6+i+xF3A9Mvty/+A3w7zbVJLKOYaUJ
         1/3g2dJDzBRWwk89qnxk6wyccDoKW7Ue2Cjhzqd2Z9GaOiAv1+0MSuGUTA3xWAuVQEwp
         zh4g==
X-Forwarded-Encrypted: i=1; AFNElJ9jvhJDJeizy0TOc3N/jYxXYbLWq9RF1z9zmd7ma9dULSpUygXB0xnt8ogvc1nYx8eEXzX6sq2bY2m7Joqj4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyA0r4B2MthM8ZufdgSVeHzbMhkcjalPO62K9jmJK28pJvUoP/
	CnnChsDZu3wcgEeOX2Gb5iKFbhz4tpjFa3r0RNtRB2cQM/gMDnEGjNifRube1f8mCd542i4RZ2N
	su60rnTeMKoUxx/Nwt/t7i1txJOqMoew=
X-Gm-Gg: Acq92OHu3oQgnKxA61oL0Pzj6//sATJfMhdsu5ZyVQcBCTeyCAs5k/y0s92xPjuqsAr
	AdnsKcwGRcD3Q8R5EBIdUWlaRMOH/WKz/2RRnlzzX+1IVPYaqoTemBhd6/Ijhw2AB/ckOHoHEEE
	COADTb0WElNIxC5ekJLXqdZaCj2AI3cJJo+NIDX4cRLDDiHR5IGzECUfW2QwLQv3pAbYZBCy4iR
	dv8PzZsNsMB6/uh35niaFo77FXfTpzdzxLEKZkOidIg5C3vCj4issh3eL0KlwC4Z4+dWr+XEhwz
	aDqatclTMSUZWxMY35W1pWNKTTHGYE7hshYsu4YwEERFMEC/VRLeTnzbmBFB1Ph8eRYn5xNrlFB
	TOJ8uPh54kBhcbNqsp/9f5PqaQsP645ekuw==
X-Received: by 2002:a05:7300:6d03:b0:2e5:faa9:ca76 with SMTP id
 5a478bee46e88-304d2edad22mr421686eec.7.1779958809888; Thu, 28 May 2026
 02:00:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521161405.64042-1-SisyphusCode0311@gmail.com>
In-Reply-To: <20260521161405.64042-1-SisyphusCode0311@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 28 May 2026 10:59:52 +0200
X-Gm-Features: AVHnY4KwJu-7vDA81_EynZT2Fhn_w40HuYvwpLmdN038uuozXTwE7stXZRgFkpY
Message-ID: <CANiq72m0K_UUzksuu466s2GhQuXnYYJV24BVX2X8jsk6patF+Q@mail.gmail.com>
Subject: Re: [PATCH] rust: module_param: add missing newline to pr_warn
To: Kenny Glowner <sisyphuscode0311@gmail.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 6:14=E2=80=AFPM Kenny Glowner
<sisyphuscode0311@gmail.com> wrote:
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1139
>
> Signed-off-by: Kenny Glowner <SisyphusCode0311@gmail.com>

By the way, we put tags together as one -- also please feel free to
add me as suggester like the issue says (part of the reason behind
these "good first issues" is to show you how these tags usually work),
e.g.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1139
Signed-off-by: Kenny Glowner <SisyphusCode0311@gmail.com>

Cheers,
Miguel
