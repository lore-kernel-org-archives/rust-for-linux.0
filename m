Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BBA3DBD4A
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Apr 2026 16:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775838929; cv=pass; b=QGOBKIOekfVYYajxvqC4JY8yDoFJfQjuXoI93V/rUtMjjBqgZtLDxy17sANCbqZRYI3hQ4LZsxgBq9kukC0OFCkBZvkpKyxfnVxei2Im9P6lSGmuA0bm3ME5csJTSnzXwcwJkSJ9rz1/x/88Z5RmU/98i/s/16EzlwCtSeHsOxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775838929; c=relaxed/simple;
	bh=nZhZVTEl2HixnZN4nd5HjMhIolvVAiADceEjgAbf9UM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SVSFfqufnJe3TNcqfAnh4VEaKexkSWlxszdu4axYfK/5lQ20EBjL5zwpGBkhhHxFciUnXsOXhE/qH2kgkgovrZajojZENpPQYQMGq/5cYLkaiB3VVgmKie+rldyYnjRrp9zSow1GR60hO4V9fylrsB8Bx7myxTGrG8ltxF/YIaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VjCWPq3J; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VjCWPq3J"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2d5d696d968so64701eec.3
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Apr 2026 09:35:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775838928; cv=none;
        d=google.com; s=arc-20240605;
        b=Ju3homN3uEAPphd+CHsH3XAAbZlXoUGBn5x6WFtEE9JOyWPWWao3NvJKsZHqv+7pKh
         VHMpLLqdNA1IAkrAwUNzr8BDw3NJwVX1EQocaJMeD27zq3nVsYIxEf0ss08eHR58W4/v
         C2n8NkbI36jRkNICDvGEnl7BJwaw0tGtTT1juztI3IX9EOpacZo0hK+uWYcC6X1VceBh
         hQ/kliM44SW/VAFRccjwDKXGZN4Li5mZgvYfqk95Ajp9iaMlApG+ttK3rX/bBeT9w6S5
         MGwljHkzbFXu+c7NQqAV1WMIo/Z2bR2nB77K7ElwBHYzm0NlepaHbu6IuUxK+kTAHcLw
         xXWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1A2t24dEeevhX3tSnHC8LYu/k2C32HhKCU7LEoHypy0=;
        fh=drOoxKatBZ5lpOPbCe3SkUeqGj1qGB/h3MEb00x7T6o=;
        b=ch0sJTj1UhcJ0X29fr/d1S/eWZH/CgHl4HGduRLxbQFj7Urwo8DuzQycT4PZEAKeNv
         MGt1r10oU2h3LkTWJFuXWORRda7Z352jAQsRHveCzxY0KEsWkZ5rQt4TlMe5e4ffPgpx
         3VCvPq1aYVVyOLU742R17VtmwDuVD5P6n2FJ98/6mW+6KfWKvsZBmcLd2Zl4csVETMaO
         2Z+A9ir/4yKYR/6Xg/6fKCm84WFs2/cPPabRMI9L6NQuLmi0He4gz4Uj7is/6DD15n9b
         9d3yxfathMRnJRWFaKzryWlZJ2G7FIBzu+vBHfkbySH6gx8lVObkcr8CnJEw5MhUFje7
         qxRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775838928; x=1776443728; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1A2t24dEeevhX3tSnHC8LYu/k2C32HhKCU7LEoHypy0=;
        b=VjCWPq3J776DCvqUz/3Q2PCVI/5eF1JL+3npWZ4iE7KYUM+2qWE8qBQXZHjHMFSkJ8
         eL6ozEpTexjq/ufYpg7L0pvuZEBEsSBP+7rFWG3bClUrgVjtM/+m3jt1zj7mwjFghXj3
         DObSmtpcUWKOqa0ZB3zdK3WzHfRY8NzfULKUK6XYddoC1LY74taYWhKCELy6suNrDE/j
         iVIcjTqIpK9xZE8U/rfaXeAfeD0OvEZt/155cop+JOUTPUDfup/i2NczLpVNdsSvxFd4
         G9nLy9XA2DKZbuIXwGZAX4/C7fJNe24o2vcBTO6I6mv/HSOZWkEZp3d9I6H/UMpGhxs0
         5s+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775838928; x=1776443728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1A2t24dEeevhX3tSnHC8LYu/k2C32HhKCU7LEoHypy0=;
        b=M5IKVSXC4HQZ2vQ+f6WvvmoP553t0ipbnEoCWs7DcBQiqYz/6iMF0Js5EAvxFmrPE+
         S3DBC/eq5Z70ZBc2UmT7qgF6Yq/DTHvgg3b8QjcRIq65e86nHkUbz7XEPmR7lKbR4/Dg
         5Ll1b8yE9Aqeja89Gfy0DjIb0SEKuKDzN0CyQbIkgo7PZioXIcYEzv7fWwfGPgh7slQh
         cEYplAY72Kv+OcD8Dwt0mEiMQyciTcQWW/0iodFEmfN5C/n5K0cXL+Wvu5+ExjDziu7q
         gNrCeX3ozpxmYE4LFWP6Q0ON9TGXoSfPI2roZfWIrktab+svP40wU46b2FnNyg3d3u0i
         C8Wg==
X-Forwarded-Encrypted: i=1; AJvYcCV9sker//05oWZECWKR/9d36ikVRZzpvp9Ajd/iVVS3soHNuoguCb3nZ4wTpzjqyxCZGC5u849faZ4WjVAJ6g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr5g0GxppreBCeXnQ/5GawMhfcuPXOx0faklHbtsJAEq2cPp9A
	NYlUshbgUm6pyanKC/o8QE7b+fgPROo4K2XKpYNEOTtkczHQoWXGJssRRADDE2UFnhYGZlKqBAt
	P+9py7bdEYdvDJZJrbD8zYVxHfF6vdRY=
X-Gm-Gg: AeBDiesQTTteTDzhosmI+qjSS/2EkMNaJmhXW/a9pW1ulwV8iNdxXYaj3c0EsRHjGqE
	a40VLyNw/9torzNSKI0ZeZtgeyRINFB7MS6i4Lv6SEZht9KKG+rKaYJkFLN9COwk3kq+s3Rd5l7
	b76XCAL7Xin3Ou03RxBxyzeQEDrAWsKBI3TjSFeP5x28ML2oquqpHe9ZzxZWaDOLHtke/WS7jey
	eyNxp249ev3k2Y++QBv7aH+H9641i/pkSvumqC3A5DKovMfMPon1g2KNCiBPXZDi3jjXqU2lNpQ
	vB3oD5X6pqmXJaSSpPOUCZ73gMDxqoAxA72aqDZVhlj/Kk8QkGFVVeIc2ahapFAJy8RSwK1QJLe
	b9Z1GFW/EQnZCcPux+NnkrtY=
X-Received: by 2002:a05:693c:3114:b0:2c6:7f49:a862 with SMTP id
 5a478bee46e88-2d5871bcae7mr817130eec.2.1775838927812; Fri, 10 Apr 2026
 09:35:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ANIA6QDpKJDgGvi6bWi53Krz.1.1775836309095.Hmail.2023000929@ruc.edu.cn>
In-Reply-To: <ANIA6QDpKJDgGvi6bWi53Krz.1.1775836309095.Hmail.2023000929@ruc.edu.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 10 Apr 2026 18:35:14 +0200
X-Gm-Features: AQROBzCEbimQSafwwRYOmIwGS8A5xzuRb2XBrZuca3M22OU4taVbHqoeyVYiwK8
Message-ID: <CANiq72ntFnV8ESA7gOr1BhUNVrNKpG+BqO60o2-h0vPxfB0zig@mail.gmail.com>
Subject: Re: Re: [RFC PATCH 0/2] rust block-mq TagSet flags plumbing and rnull
 blocking wiring
To: wenzhaoliao <wenzhaoliao@ruc.edu.cn>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, axboe@kernel.dk, ojeda@kernel.org, 
	linux-block@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	bjorn3_gh@protonmail.com, aliceryhl@google.com, lossin@kernel.org, 
	boqun@kernel.org, dakr@kernel.org, gary@garyguo.net, sunke@kylinos.cn, 
	tmgross@umich.edu, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2026 at 5:52=E2=80=AFPM wenzhaoliao <wenzhaoliao@ruc.edu.cn=
> wrote:
>
> On a broader note, Could you recommend any specific missing abstractions=
=E2=80=94either in the block subsystem, configfs, or elsewhere=E2=80=94that=
 the RFL project currently needs? Alternatively, is there a specific TODO l=
ist or tracking repository you would recommend us to look at so we can pick=
 up the right tasks without stepping on anyone's toes?

I would recommend looking at the notes I have at

  https://rust-for-linux.com/contributing#finding-tasks-and-issues-to-work-=
on

and the links there -- I hope that helps a bit! :)

(The kernel doesn't merge abstractions without a user, so what we need
are use cases to justify the abstractions.)

Cheers,
Miguel
