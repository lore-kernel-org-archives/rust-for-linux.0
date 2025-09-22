Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD502F7ACA
	for <rust-for-linux@vger.kernel.org>; Mon, 22 Sep 2025 08:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758529359; cv=none; b=cuKtBdQuGn0+CWTSYstTldfvPbIDq1K8sMCH1unMT8okvNPSOoNSGUNl6tngVf/2lbMfWM35yVU8Up9jxa4Tf/zb+PCg3w/SBM6/5076MKoSZQRjSemMeaS9cEyrcR8WighHNx4bxCF0lnrXhEUIB084y+hFpVuS2mfooNXAEoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758529359; c=relaxed/simple;
	bh=lyJzR+MVwqPLG6GO9m/YCbpHOOMbzKWbxjXNcC4GSso=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ty6/rrzUFwn07rztpPJywjydC2+lrferylkY7ouFtaMKv4A+Zu9HVoU0z+hZk1DSnRk+nfdabIC5ukthBlqOV6sIhPbC9brJ5SHZ7g9gkQ/Yb0QckNKLV0vMXR6IgjMnehtUGbFQ8k7BtccpWiYbptGQHi8etNfF0aFEzAIWUkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FnhPRaWe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FnhPRaWe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A130C4CEF0;
	Mon, 22 Sep 2025 08:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758529359;
	bh=lyJzR+MVwqPLG6GO9m/YCbpHOOMbzKWbxjXNcC4GSso=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FnhPRaWe3lfBbSTJxnU9jBgPjaoghMH/S+Tep4XLN2A5fT6hM5ig2WcPSPN9TKLGO
	 cKLQMrHDShgsQioXIhYN8XhujHkOOXYVS4gmXavmkTguhKDEc8KUPyayaU6avY94y2
	 1/sVi/9P+sgwl4tNUMF78doB6N/ezFcXFKHfkigAEUYQXYmoHzU8HDkz8xmpryH02k
	 Q61002a8kYX2EXsOLoPJzKIaT6r9o0EXHrsrQO5I82bs3F9/cKlW4NoQeTzyRqf/4l
	 kAcqFR5MTNQQq1y2o9nFtpZOwOcUvMGPNh3vX22v+HKc8Dzg5xwss6jWZUeL0zrH5g
	 OKJOo1b7W9+lg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker
 <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, Thomas Gleixner
 <tglx@linutronix.de>, Anna-Maria Behnsen <anna-maria@linutronix.de>, John
 Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [GIT PULL] Rust timekeeping for v6.18
In-Reply-To: <CANiq72=33y3L8oN7d1BaKpD6TxEzhVKUnyx7BGyX+z+HdQtUBg@mail.gmail.com>
References: <87o6r6wtq3.fsf@t14s.mail-host-address-is-not-set>
 <srjU1u3baX4w21qEJilAGIT7S5H_ePu7EGtxWPBWfmpn8yDwI4EuiRdK2648g3LuDskntabTv1uy5AcGtnFkuA==@protonmail.internalid>
 <CANiq72=33y3L8oN7d1BaKpD6TxEzhVKUnyx7BGyX+z+HdQtUBg@mail.gmail.com>
Date: Mon, 22 Sep 2025 10:22:30 +0200
Message-ID: <87ldm6x5fd.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Fri, Sep 19, 2025 at 1:46=E2=80=AFPM Andreas Hindborg <a.hindborg@kern=
el.org> wrote:
>>
>>  - Additional functionality for `HrTimer` that allows use of operations
>>    that can only be executed in timer callback context, or with
>>    exclusive access to a timer that is not armed.
>
> Should I use this one or the bullet from the tag itself?

I would suggest you use the info in the tag.

> (For future PRs, please avoid duplicating the summary, i.e. the part
> that goes outside the tag message should generally be about meta
> comments that should not go into the repository, like the linux-next
> note.)

I am actually a bit confused as to what information you prefer in the
tag and what you prefer in the pull request message itself. I would
appreciate a reminder to use as a guideline. They seem redundant to me,
which is why I used an empty tag last cycle.

>
> By the way, I noticed a commit without a commit message apart from the
> title and tags -- for future PRs, please try to always ensure there is
> some context, especially explaining why something is added:
>
>     ac0a7bd27f65 ("rust: hrtimer: Add forward_now() to HrTimer and
> HrTimerCallbackContext")

Thanks, I missed that somehow. Usually `check_patch.pl` will complain
for this kind of thing.


Best regards,
Andreas Hindborg


