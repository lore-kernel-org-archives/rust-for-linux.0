Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02970158861
	for <rust-for-linux@vger.kernel.org>; Sat,  5 Oct 2024 22:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728165926; cv=none; b=Nd9CSTF9jZhJ0RV6NKquv/fC1SSuhLXBi2rgh+NROaIkHYceu5O3TX8qvm3sfcp4ghlZiK6l9B6fcnt7bqEYC14VSa+pQotWXx5YMm/A+2wgIWLSX5dFMEOtNMhDczJmf8Ly7p9iPBNBYZlnMEBZlYoXgZkDH+v25axv38YJYl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728165926; c=relaxed/simple;
	bh=3TW2gb6wZRH/zBfAHyOmlhJ+VLrJHd4AFXEgItUdjB0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uv3fCG/vA9LMpPqZG7k8oxXX48AL8JWL3B5p33qiiK6e1qIHbNs41W5PohCM/hV6d05nUu7+HVGdWave/nzH7nkTA0v76+M4NlV4DdR9iTGL2Byz2tHMmiWN42sMCkWFKrud4rxzQ6yvbKu4a4HF8zusXxETNJQBIynOezHVbc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N3S7wFrc; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N3S7wFrc"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7db61fd92a1so151802a12.3
        for <rust-for-linux@vger.kernel.org>; Sat, 05 Oct 2024 15:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728165924; x=1728770724; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3TW2gb6wZRH/zBfAHyOmlhJ+VLrJHd4AFXEgItUdjB0=;
        b=N3S7wFrcL9TDh221G7pDdbcQJseL8hOv9OzNkShJJqLHrJBHhloqjMINihJfIhTN91
         nYOm8Q73x9E/OOPzIKEtZQaH77KZD7YVwlkGSbc4PC0X3XxgKGe07ODtnISjaZy+5Ub8
         iehlKjTtlFBuE1W7GQ0Co8aHXF4GId8tTbG2+s8Q3dv3VPAbpvjyeUothD2YZRzBq2UX
         ZELm0DdMkwSvVAAsobHZSVur/2O/JFtRpq76ca8galm3Q4pW8lkAWCTldse0lGY/0M5I
         pFsWUJx6gzPZBQogD1ufOo8OyhYmWvBcaP67uHyzRxj7CcKkoK3dDwTmifeZ4BrDqGn5
         5Kcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728165924; x=1728770724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3TW2gb6wZRH/zBfAHyOmlhJ+VLrJHd4AFXEgItUdjB0=;
        b=s6c0L/HsVJa63xAH8NmoiK4ZbY/N3drOpmibPcDw1yfF6ke5Kf7wDl0YyojB9l/LJ0
         jj0dUN5cJE14C3AGkKKYkNL5901Mn4LdbJVJDxtPHtzku1wlChqAHeCmh3K3fzQxKnvY
         SZ0l0J6I6SJXbXH3FBtH7TkezhDJbN+U3S9Wxow2lRRohNX3x/LT+1YOVHWaUMk8fkL+
         GYNvvpffKRHO8/5dwQtL5blZKv9EsO0o3VS/ZPsH2JmYa3mXPrG77qqitpyvuaT+H7yF
         VO9wGPxbsecMC9pJ8fjrJn4acmjfb6OQb+tTmC9t5txS9ln34McmGyoQN8vtTl317rMW
         8BKw==
X-Forwarded-Encrypted: i=1; AJvYcCVC6R1+mPhQ02unOZjiY5Fw9Ejzk8DUfyQS5jCJd+Tjn4I+OaQZkKsm6Fnh18m4stoGMc2Zv9SUMIvAkoL/Yg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPi11f5mG5P2irK2vWnkDh664yKltCjmS3+dPvw8NCGonxxAd3
	dhlUxbfQsJhkMeQ7AGU0Xfd2lW6p4TvuDTJP7Gtim+XkCV7VRZ/1FDWq2HVpUsW72Plj/mFULuO
	b7z3+JSbihCzDTe2AcNOeog9z5Kc=
X-Google-Smtp-Source: AGHT+IFWr2RHggGOLLtd3/4pHxlSJC/aBCF44RdFi7EQKDrWYCaOgtFsZ/opeQRXKm+l9d/a89jAi5gCVsZF7UXNlMI=
X-Received: by 2002:a05:6a21:99a1:b0:1cf:46ff:973d with SMTP id
 adf61e73a8af0-1d6dfac82d5mr4832946637.9.1728165924270; Sat, 05 Oct 2024
 15:05:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <BL0PR02MB4914579914884B5D7473B3D6E96A2@BL0PR02MB4914.namprd02.prod.outlook.com>
In-Reply-To: <BL0PR02MB4914579914884B5D7473B3D6E96A2@BL0PR02MB4914.namprd02.prod.outlook.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 6 Oct 2024 00:05:11 +0200
Message-ID: <CANiq72nuH-PaLnkn8AEmg1reBmUS_cxsxkwwxrT_U4qYT8ufQw@mail.gmail.com>
Subject: Re: [PATCH v3] rust: add trylock method support for lock backend
To: Filipe Xavier <felipe_life@live.com>
Cc: aliceryhl@google.com, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, benno.lossin@proton.me, will@kernel.org, longman@redhat.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 10:50=E2=80=AFPM Filipe Xavier <felipe_life@live.co=
m> wrote:
>
> Add a non-blocking trylock method to lock backend interface, mutex
> and spinlock implementations. It includes a C helper for spin_trylock.
> Rust Binder will use this method together with the new shrinker abstracti=
ons
> to avoid deadlocks in the memory shrinker.
>
> Link: https://lore.kernel.org/all/20240912-shrinker-v1-1-18b7f1253553@goo=
gle.com
> Signed-off-by: Filipe Xavier <felipe_life@live.com>

Applied to `rust-next` -- thanks everyone!

On the docs issue discussed in v2, it may still make sense in the
future to add a clarification note, i.e. rather than saying "without
...", we could give examples of potential/possible differing behavior
there and/or link to other docs or types.

Cheers,
Miguel
