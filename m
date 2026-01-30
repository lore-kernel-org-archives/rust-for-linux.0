Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759BC1D5151
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 04:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769748183; cv=pass; b=OuTmKws1YtRH1meX51ZvOnZRmGVgJuVgCzNCNi9z9uWm+QWxfzVkT7jFn72Divoz3gh4hRVavcEnjrVaEyIkHnbGJyDIdU/ekLKkhPZpTW8go3a2Jth0KdHQGsMrZkt3r/4iXtrDwzkzYEljhsQic5swrA42Lwj2EYrpE/GDSYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769748183; c=relaxed/simple;
	bh=tJOsBxmqkupH8loSgMmWr48T44IrdY48UJF/0gsFmXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CfGQO+rbdTvZ/buQU7QrOwBTRbTJEzheBsOV0P/HkAe/D0xswKIityG2DjN9yzi44JSJPLHkj3lk0hiSYtHVY3cIllb9EZFjn+lm1GAKVtiSnig/2ujPOen0irKauHL15RuDt15ealJH/R3mcIuHMnep8vEdWzXu5tljeWBB8H8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bXgPrb4R; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bXgPrb4R"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2b6aa67a792so290415eec.3
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Jan 2026 20:43:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769748182; cv=none;
        d=google.com; s=arc-20240605;
        b=L6QjQzrNwsXuXOug4+fuN/pe97f07rOAMNaLemXXy3IIS6pXuTVSJ4eHYT80E3jbyW
         rqqsKWmEEjeX/6TwwTakmUlOrBovGjRdPC0D9HKofxhTMMekw7fn2NlfRQdby++pAY7N
         G6bXh6Su58irAaff/MwFt9159IEE/z19K3s6qGnUp4hfusUqdc7LaiiBtLEXceFdA2Sv
         KfYMQb48imt4DWBZgtHLYNpiuSikQXv22/z71I9x6DkBrslBV5PwtHYa3mr3/2ItaK0T
         Pi86onHASLFhVFdyo68HqZhijkOmZ052q2atH+F1x857mHnrJn8NVj1QxA0HmludtIao
         eKHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tJOsBxmqkupH8loSgMmWr48T44IrdY48UJF/0gsFmXY=;
        fh=Y9H6y4nTjz/9/tMmKMGGvoByFEdV1eHgU/b8o0sqof4=;
        b=DU/er9WEQIS9fnazA6s9BHnZ6AK0IItz10nTPYviOc6ef6/JIhsNlUmvKXnv338Z+d
         gX4UuR/lzEeTu5Tbg6cWIE2PANGx0fBKAbIuUN32RRHio/ot/PvWM58CpKUeGFPbMMu+
         RkI1OwcJ6nhiixtWxMoC/8svvrV30UbMPJ+ePxZmd5C4ZnrYUALPymJc+mlJDuMxaVZZ
         sPwStcqy/eHRYOEwF8leoO4yMmsiOSFdIY7Y/Df3tCg5qUclqL1RrKDWuQGmhDd/RU4h
         5Y/Q9hLxw73v5YjFzCC8JCUHM9l89syR/l6oWnu5qecl5bmW5dy0skW53+mynDZt1cot
         bsWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769748182; x=1770352982; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJOsBxmqkupH8loSgMmWr48T44IrdY48UJF/0gsFmXY=;
        b=bXgPrb4RhI0NiGMVYPoljSpLQsHgUWVOqK/YPgmVzkpr4oVICFZScX+6ILAiHyL1Lu
         xlGkNOoH85Ar8+sq6Qegxajj7OBH9r9f08QpEVlMuawwI8GYvGloUoS8SYv4kSVHmqUV
         6neP0dHgRmt1ruD3fV9nMJb4cLxhegpGdUyMKQcvs5jP49Atvb3/XgNukad72km6MiTN
         WYPPP7yqROUAlPqyyHOS/uZLhuLFzcVkZNaXRUsUQkTXVYO216vevgp4zjssNUMUmATY
         Py+vHkOBrv63/LLW2xkMYBLuuv0JXLg1N2mKk3MP85JoYtYlpqlXbWwcKGBg2yhZmp0b
         44nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769748182; x=1770352982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tJOsBxmqkupH8loSgMmWr48T44IrdY48UJF/0gsFmXY=;
        b=hsjepxxjalKW+IczgkQlJTwv3g071yBY0a6nkR2WyJTmpXZGLguWa4v/wO9N5JxfoU
         d63XeBJ+pzWQw71qqeTVDEkQXdMQ43zpq4p9ZDtONhheGqkXkfUTioU+eW49Y1inEDxY
         Ej96ixvROSyPPzrX1MPs742clXQDZwB52Cetab/WFEoFsRRWE/ejx3Zpfh8SMZ5ewPFg
         TSp0iHj20DZ7i9exxEtspKOgIr9EgJR9wFfBGXymJyB/7XE+mek+LIzozu0W05bSHkH6
         l2wTqpt3n7IwWsHApmsJ4gzhVYqHY4Pj4Tkyv4er/wpMSHEQSz6GH2Ql4c/bp+J5j8kf
         2FxA==
X-Forwarded-Encrypted: i=1; AJvYcCVlhRpOKjtoTxWLAJF10KiGuT4+YSFC6PQ2E6beEm0fvR2N7L2Yo5tRADtj6SWun/GDaRIOv6CFKow7YB9bag==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5pwtYL/kXrRPZ6BiLjqPzhZn0dgBDryPhbg5e53AsZRkByQnE
	RACvgQoUNqB8yDf0eIFiv+ZZ7YKXqtP4PdMNgBffoNOA3TVQCYzPH+q80ypqhEP86/mIQf9hZaS
	o/YIyk1NpEOLdGobW8QF+AHZs7TOXZqE=
X-Gm-Gg: AZuq6aL2nWP2iiUbH8Z+eG6ensGWA9TZfoFf1kUksJtLX/0QHRQwOcAPDT3raqIYZrZ
	uQgrfSGSw3JIs3Dcdekdq1t+D9jnzA2onPz7VjCY64GoSxog4tUfTUJaY/AkX/NaXxbH5HUUowN
	G1IJIZPgtmVnVi6usYM0IRztXX93iRq5+oH5GZQ7FO9v90pZX9ck/+Vkb/hWk/8iLz1ajJB4vjP
	MKVOnp1R0XxlbcrcJ7HCXZ+hKUeh17PQd/N/nEzVZRV4RccqDpjdE9q5BGU1izP0DzFAlmvnHTY
	uqdUuwQAOQRxDtqOhwHKOEWpB1nYoCcdP5sNYpkoAKfovm0fkHTddf252lW+QrZvIbWktI3aJSc
	5jrI2CkP/rFAX
X-Received: by 2002:a05:7301:9f16:b0:2b7:103a:7697 with SMTP id
 5a478bee46e88-2b7c86de267mr441066eec.5.1769748181591; Thu, 29 Jan 2026
 20:43:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123172007.136873-1-gary@garyguo.net> <20260123172007.136873-2-gary@garyguo.net>
In-Reply-To: <20260123172007.136873-2-gary@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 30 Jan 2026 05:42:48 +0100
X-Gm-Features: AZwV_Qj_-wgMBEbWmC10rmMhLTHVkB67ZjYZ6I0qc28vA0AXyDmBACdkWBHHb34
Message-ID: <CANiq72mRsFcq5iRk4no2wA0GLmziiPx=WnGQkouCfZ3yWzcD4w@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpu: nova-core: remove imports available via prelude
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Daniel del Castillo <delcastillodelarosadaniel@gmail.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Lyude Paul <lyude@redhat.com>, Timur Tabi <ttabi@nvidia.com>, 
	Shankari Anand <shankari.ak0208@gmail.com>, rust-for-linux@vger.kernel.org, 
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 24, 2026 at 6:11=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> These imports are already in scope by importing `kernel::prelude::*` and
> does not need to be imported separately.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to `rust-next` -- thanks everyone!

With this last one done, this series has all been applied.

Cheers,
Miguel
