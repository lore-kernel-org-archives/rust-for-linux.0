Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A4427FD74
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Oct 2026 05:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791783745; cv=pass; b=ZvJfj8GYocZFgAwqOGQKA3Tvy6lV5AsWatbq9CeS9jpeSuJrV1uffyzY1sAY4lfn/YuQmTXtitcI2xuIC+ZD6nHSxd700lwuLMshympDPWbtY1YfSrZsovO5cbTRHOfCHnnjktVuYYNgwGHKJfE0j8Ol3VReU60Pw623qjhAhiI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791783745; c=relaxed/simple;
	bh=6LL1a/xp3TkYG1GpP8CMecojNv/eyeWnnOqmxx/wOvk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z8Nrl7YAljJIGZq9Ecown9U8ygdbODWf2+vXEaIcLuVq/MiEZXjpfbdeArkCSSM3yfv8B9sGri4CNidWnP+wz5hF0aJ0cXA068MlAvNZ8+JU8fsU2RKYHDVndejRWOmKeofC1HwUyp3iWA0SpX+S4yZuKPUvGU/CkbxFuWapwpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LLRseE7S; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LLRseE7S"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3535dd9a601so106583eec.0
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Oct 2026 22:42:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791783743; cv=none;
        d=google.com; s=arc-20260327;
        b=CEkmWRYNRyrc0TLUNs6a982OaDDqTlFtwphssuaH11iBRi0bQgx83r9xftwmCs0bY1
         gkS13XEvjPQqVKNoVlNH/1VD2rYZRBA89nnrlhZLsIV4cp58cpVRhKIaLoUdAxwtYYgf
         0Bxp4COwBuvd+ZqNYSbTCQ/yzmUO1aWbFIgiCHWFouCQLPiu4z1MGcEZ0QMbYMApbV3g
         vvZi5MUNo3LqgEUmUqSnhBIMLSlzAOIjtY1zIBmvofIN412mlTYm0LjBt/hHgklwylWB
         t0PTdgeBEqau7nj6wibUrYEnM2rXGAyhliIPQcAlJ0j4kHcBWfRKov+d77OxPdoo/0V+
         NoeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tO0Gj6J7SxgSnTqcFChLQGBhVeV6b8Pa8VP8hJKaoBI=;
        fh=K0slhjL2IAeLBC4oI7n3vwjhXnoI72VF+CPb3eTrWz0=;
        b=cLUTUYTfEk9DsyuaP6gxPj8l2NMqr33+baCsZwcLu5l9MeLxoZQSDzyWvdYmF90+CW
         ubU5AJU2QnwLS7CByjwiEVScdx6uMU08mtQCz/LlOj7iZ91VJf4Midp9oLauBiQCtSAy
         5o5LA4a1B2fjO/1VBOk4hEoGZvHS5st/xkCUq1xO7FnKTjebNjyt2jnl4z4n/Or3YA9w
         u95px458YjgbeunhTm9TbyJ47Vnn8aRHR+eKFuR/jgP78vtGb3wOTmfTbuRK/1Wi5Xfy
         nF1mLfSxisvwXCmcc0U6KfKwavOM7iJoGMt9ZMrjyyATIRksl6Zxt/5r+YrYjwLtlHV9
         KI5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791783743; x=1792388543; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tO0Gj6J7SxgSnTqcFChLQGBhVeV6b8Pa8VP8hJKaoBI=;
        b=LLRseE7SDIUy0zgcoGUGvbU9dYSDNbSVLVe+QSEFGspJrlmf1Tm7dbjdRWIwjXv83V
         uwjhvrgZd8SskmHIN+/0KFFYPS9fKxhjZ/0fJmcoEfZxezp/cBP6alqUzCj34+YGLK8R
         kZSnOk2Rn725feMEbcxPRJrb2RomkWQbCLKPdkAYksaIfPlu2WYCJc62x7Xv7pvkWM3d
         VT8CDbmdfv0MJABPYP0zXrEKUU7i5imjr56/bYssN8epe0AVXoPbyf/TjnFvj9QlEpHH
         RUZZVQn6P7c//M9eS7fuaeu5Uo4DBUfctVulDSz93eSLpPpBHWe0xA7v35x9cc/LD07k
         L0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791783743; x=1792388543;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tO0Gj6J7SxgSnTqcFChLQGBhVeV6b8Pa8VP8hJKaoBI=;
        b=Z8GYqhCFxBXlBBlHFJIJ9ZlHNESaQGDKo7qXrF0rzaz1qCFTmbitUSkAeVDm4plmtP
         zuwYjnn2fbObDBN5w0xZF9uFaIUEtZMqsu8a/0P43wrCURw1EuE762IcyEGSSrVuY1LQ
         aU+TOebSx/T3HOHuW73xHe/GCDigkCSidZa4K2OcNnycCyDlnZIf6a/TTSJ0J633/4ZT
         3rAmGyobhCh6nhlu6wTXQUzx8SfGU0DQ30XLwvCmvKLjUvZCd5hZc46TwLBhChqY9zM+
         E1XiE9T3O/IltMMJWzrEwlg0W9uQVtj6oHKgrxhI6lOX6iu5/DkDzkrB7OOjq0adv/uX
         nieA==
X-Forwarded-Encrypted: i=1; AKwUvBzp9si2xwLxrZ1d5DtvEYv57hyHss+M7bm+XBHAq6GVqTANRacb+T+5ZKqrETWcLQcKezYXGJW1Zh+Zs3LFsQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJEkHxOmc0qDV3oJ8ORG16Ph7q2lsRIi2KghXYuZQ17E7RjvIZH
	5StiUj79KA7LbqH8A/1zePyp8rmZOk2Z1mt0g7LhRKrBS94noqkWK+Y2wXOlnBNk/SPSJfsg8rI
	t/uWSerToUCy8qyjI/GUCHS0f3AogfkM=
X-Gm-Gg: AYBFou32miTPf0ZM0qxSr4OBCV+HCDbPFrbHxlEW0AWbXisDxBGsvEfrSUAd5mZm8Mh
	gBrP6mR6BM3rDLB7hLt8u99R/aRFMYbrOGQ20MD3xbezq+xYCiNC913+Y1w6f3d0aFI2jNhjpRB
	mOJuwzwYXGsKb0fh+9oYIwdgRvIV5+7dMTXRvy4wRseS/4n4OB/oANcOLHd4HFAx4S4fMiX6Oit
	kzIPGqcM1PeH1vBNMsk3roTS0E1guUUn5uuKysbYk1E8x7JBrimsMFPm1+nzsO/g+lo3y+PMnZx
	BCU9QF2S11siakt9pAmaJwXb19BQ1AHn5UNpI+Ffc+IQmBCMbgts/gpEEG0+l/7JEBRfYdLAd69
	O1OC6HHVEi4XJ5kIjW0SBBTgteMVxJZLpVHk02Bqzc88XX7qpoIceiuRHswz/rBp1p0/S6A5bs/
	WuzEkHQi7sQ7LEvn7VldiWO/wNxMGLNs8JCe0to4ftBsHlg9U1C1w=
X-Received: by 2002:a05:7300:d18a:b0:340:f698:fd56 with SMTP id
 5a478bee46e88-3537e04365dmr19355936eec.2.1791783743309; Sun, 11 Oct 2026
 22:42:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002050428.2746277-1-tomo@flapping.org>
In-Reply-To: <20261002050428.2746277-1-tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 Oct 2026 07:42:09 +0200
X-Gm-Features: AclHuK8QxxeaTvf_HCT9o-2EsD6x53Y-J31HTLBBlbKcrB7C31SxiuwHgP27Vsw
Message-ID: <CANiq72=Qhu4tEbujQk9gVTpNxwgRYCEfeQNrAYMrb4et0L+7ug@mail.gmail.com>
Subject: Re: [PATCH v8 0/4] rust: use Delta instead of raw jiffies for
 timeouts and delays
To: FUJITA Tomonori <tomo@flapping.org>
Cc: a.hindborg@kernel.org, aliceryhl@google.com, arve@android.com, 
	boqun@kernel.org, brauner@kernel.org, cmllamas@google.com, gary@garyguo.net, 
	gregkh@linuxfoundation.org, ojeda@kernel.org, tj@kernel.org, 
	tkjos@android.com, acourbot@nvidia.com, anna-maria@linutronix.de, 
	bjorn3_gh@protonmail.com, dakr@kernel.org, daniel.almeida@collabora.com, 
	frederic@kernel.org, jstultz@google.com, lossin@kernel.org, lyude@redhat.com, 
	sboyd@kernel.org, tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu, 
	work@onurozkan.dev, rust-for-linux@vger.kernel.org, jiangshanlai@gmail.com, 
	markus.probst@posteo.de, FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 7:06=E2=80=AFAM FUJITA Tomonori <tomo@flapping.org> =
wrote:
>
>   rust: time: make Delta::ZERO generic over the time unit
>   rust: time: add Delta::as_jiffies_unsigned()

Applied as requested to `rust-next` -- thanks everyone!

Cheers,
Miguel
