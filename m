Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1277363C4A
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Apr 2026 23:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777072944; cv=pass; b=YOZ9EyNj6iHk/UBUs58ERb9e2wdez7BOyD9LotnUNOUgaDz6i/hmuDBjcYZJ/AL4SHq+AvO460ShmVBQj9ZVTwwbNslwifRdOiGLTigyU3nUFbqtFB83+eCw3hNGSmF5wbD9C+beToz03Q1NLgY8SstT8kiThoDNgl8GUKOXij8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777072944; c=relaxed/simple;
	bh=8uNqOtRziWkp406K3+xE9xV76Iij+8qjg5F2FzuB9jo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fwl/kvrkT6wFCrmJ329xwJJaf+q4yOo98eVU1IxQuMLu7aLOJvV6G4T8nUN5Qb/0qAbsg0MCp8fT+YXtzFSMXMnGFt8DWFIiCxfTwQpyoBAlEUBBodsU6QqT1rax75ukL/44X55jO2SCumZCNZzMMwmJkU1g6wKx/QcCYBO2Uy8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DbTmpKAE; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DbTmpKAE"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2dd52990758so518310eec.1
        for <rust-for-linux@vger.kernel.org>; Fri, 24 Apr 2026 16:22:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777072942; cv=none;
        d=google.com; s=arc-20240605;
        b=UB+XPzzXpdh1QZIRQS+lDi8IkSs2L2ESgub8QKsQ8QodmxG5REB6zmYyF8/dDAAABa
         9g1Stb+0jQqZlCvd4XZtchsCZY6CssOthq/o7vLZUB+PCSqL6H9w9grqVHXuEwmpHI8g
         Q7QTQYe8LfYp7ID5e5h0dslQtt5JEo9gjli6hu4vd4qg/9EW/UB8Ewyk8Qf4zNk1MEh0
         EuQNWeP2E4ixYAx5zoVIhhIybQrTmstOM0l7AGi1YhpoLIx6C4otMT2OwLEi/4cxmmWc
         1bP29njQkM2jGfKTnJN/tSQeXan6JJwZaUN5ZVHMXqeO6ptdBYE+qQezjt24tW5ywFbW
         2S4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8uNqOtRziWkp406K3+xE9xV76Iij+8qjg5F2FzuB9jo=;
        fh=sMjASAUoQ1ITgBeSI/2zZxSvz297bABBe0OPMbU2gaY=;
        b=OYYd+2KoTjzM5iCFWc9Ky650dp4OLPs8B3undNnntvDRlfW1ENbdAzF0sCVD/r4ayl
         qBm2IGpMdSv0hVQx8zB/9iWpavDU30zRnTNNgMDx+5LiP+QVaPzhW+3ux14gZbQowIU/
         ze0mEodraNOXpdYbr62tgqOZOzY4fXKKdN1/KDzNJr+ZSIefY3mZBuoLUCLcdtgSOqJO
         syMn0Zl3ydsZAXHx2tfPgH1nIj8h+zoRTddIsO0XZuQhdWTf59Pj9JznLfjLEsD+GFuj
         UrL5jQkrSdxU47mgfLy7yZANqChMScPgCjfH34SylywkpiiSLQ8PZsUchP/nbNXhAyR3
         I2Kg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777072942; x=1777677742; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8uNqOtRziWkp406K3+xE9xV76Iij+8qjg5F2FzuB9jo=;
        b=DbTmpKAERwUgCswxIeIkrurKbSmeInk8CKb0omBALtp5xTTGDI0yz8KkRGNVZ2wsnH
         VOtiF365W5sfkg+JVDBk5NwJdCgZAIm7PLPnnuTND2EY+gnwBHTFzsR+PShCS0JAP8PN
         ALBm2zPP4OT2qbwEyJgOeJgKWUcsIuZyeltdWAY53noYZ+IgTqmXbtmQgfI5iYzUuxCi
         isxUBPC4vOQEgYkrV/s0tYE83mPhUppiji7BwTlezuNDFSMi9ByFBnxk7qjtHVZcxuTn
         lHFew69h2Q9wJW6l80Uj7oxMcSLF6ThzDTex06VPy3F3PdZdWIQJx4tyo1grRhCJ4/p9
         ZUnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777072942; x=1777677742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8uNqOtRziWkp406K3+xE9xV76Iij+8qjg5F2FzuB9jo=;
        b=iduJzaL8txorYwHyypodWLZGtlpL2pm8s+wr7M+V8K5S9Kq3AGZmdV4NC5dqiEcqYG
         dSDf715b4TiyiqtJzJQHYHX3LDfYWo5Do0jZAzIOBSjt1Ej9QqNItLEykRqsiJbBLs2/
         2cU1a6bJs9YeyPOGd8C0eAxeAx/mt/cuAV6mFvOPhS8/2TYmBs7LnZ15SawpVofZrSs4
         +ci7Gitgs1ALEWXBXKU/wEKlNIjmReghN7L3Gc2/t8YxxsivmgC+CT2f7IilSfwq3dNN
         nwfPQhmefl0cSSYefZEF+Kk+88LjXH7+mFZ6e9ZIT7CoxCc0iMBCnrM+yhtancQtJ6lB
         USjw==
X-Forwarded-Encrypted: i=1; AFNElJ+WPfoI7sI519T+QcTMlijAXFs1lPQIZpV+H9jX8fwLi20MIYM5EVwE2Ywg2w/0b2SPXpj+fIBmnp/kzf/6Yw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlYVbigXr1Miozs4TLQR4c2l6NLAu9yuaCQHISoaBitBO0yCrm
	ddOtAoAExfhBSzHnoIYIpOCWMud0UvC0bptYxGlwpJwPHL1mGyfRdV8NTTYadjeDy2xHFb5HcyU
	MYyZUcBXS1FnQ2OfpBk5QdP1K06gNtAg=
X-Gm-Gg: AeBDiesBPLH5FyNULfxV4tltEivscT8MVYKadOkhPwLYVEZf4pM60dA2xaMn8MsPaqT
	YREwjp62vCBBIEeyfYyBmQZ1Pmn//cpZL3ZUWFAPEIFU9k44LL5+nPajdmFdq7FQaPwr4ZOkJqS
	1i3up5Ody9XNNqrruLw2tcvX9yKnZvoUWJkooSRd9GdQZ5COy7C42xKQodZG0qdvC8wr/EVVrLT
	k+q1rGEbyTPYetX635FZGVymlhGONwCKPXG/PnhmR83a1ur0/j3F0nX8CJF6UuJ+E5/5X12jS1V
	yOgrizIKwiKcK24xSAX8scKjrEdt8WnybgUlhWhOzkNesfmP6kg4Podqr7srv/uOakoFf2pw9IH
	FHIT1+vrUo6zaZI9CIluWnhOFqBVWG/J/OA==
X-Received: by 2002:a05:7300:bc0c:b0:2d9:6373:ace6 with SMTP id
 5a478bee46e88-2e479e0cf48mr7020572eec.5.1777072942334; Fri, 24 Apr 2026
 16:22:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <971a606f-3319-46c5-ad84-a250f8044d53@nvidia.com> <7ia4tst18grc.fsf@castle.c.googlers.com>
In-Reply-To: <7ia4tst18grc.fsf@castle.c.googlers.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 25 Apr 2026 01:22:10 +0200
X-Gm-Features: AQROBzBz1h71EdR_E412qUn58-iTTFI5zVIMWwVgm4FXAet1EpF2XJi_Nua3Tfs
Message-ID: <CANiq72m_gh1wpdvd2SVJ_kAsiOjmQeJGC3iuPE-bB2_ODa9fwA@mail.gmail.com>
Subject: Re: Maybe make Sashiko emails opt-in please?
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: John Hubbard <jhubbard@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, lyude@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2026 at 12:16=E2=80=AFAM Roman Gushchin
<roman.gushchin@linux.dev> wrote:
>
> Miguel, what do you think? I can keep you on cc, so that you will be
> receiving reviews, but nobody else. That would be my personal preference
> in this case.

When I queried about this feature, the motivation was to make authors
aware of the existence of the reports, not a fixed set of people like
maintainers (that is a good feature too, but orthogonal -- I added
myself to the Cc to clarify/help if needed).

Now, people do care about receiving unwanted email. That is why I
suggested at the same time an opt-out feature for the Cc's to Roman et
al., just like many online services provide the now-proverbial
"Unsubscribe" button.

Having said that, one thing needs to be very clear: in Linux, the
submitter of a patch is expected to defend it. And, at the same time,
anyone can submit feedback. That is how this all works -- authors
cannot block reviewers from their patches, just like no one can block
someone else from submitting a patch.

[ Of course, there are exceptions: if someone (or someone's LLM) is
actually being a troll, that is a different matter. ]

We have had bots since before LLMs were a thing too, as well as other
automated tooling. Sashiko is also already sending reports directly to
kernel mailing lists of similar size than this one.

So the main question really is whether we consider Sashiko's useful
enough or not, not so much whether it is sent to a mailing list or
not. Either the reports are worth our time, and thus it is best to get
them in people's hands as soon as possible; or they are just not worth
our collective time.

Regarding that, I asked others in the team after we had some weeks of
reports, and what I heard is that false positives could be lower (who
wouldn't want that), but that it does find real issues. We also added
prompts to Chris' repository to tweak/improve the reports and catch
more things. Roman may have more data points for the wider kernel.

And, yes, it does take time to go through Sashiko reports. That is
undeniable, but authors are also the ones best positioned to do so
since they recently wrote the patch and they are expected to
understand what they wrote (which is also, by the way, what we
actually caution people using LLMs to submit patches).

The way I see it is that if an LLM doesn't find anything of substance,
that is a *good* signal for a patch. So it goes both ways. And when it
does find something, even if it is a false positive, sometimes it does
mean the code (or the commit message) could have been clearer, e.g.
perhaps a comment is warranted (we had just a case of that).

In short, we are all trying to improve Linux here, and Google is
donating these tokens. If the system is actually wasting our time,
then we should just stop it. So far, what I heard before this thread
was that the real issues it finds are worth the pain. We will need to
decide one way or the other. This also applies to the future -- if
these LLMs get better (or worse!), then we should adjust our position.

Cheers,
Miguel
