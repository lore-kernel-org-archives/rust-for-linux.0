Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792492779;
	b=Gwgj1D9LeFQZ+1j2lgpXPXEC/SPKTHoYfmXKj+Un7kikZb2XJjKmtpeS8wbJl17RWd1c
	 vRXIcI+uFIA2XP2hEgLN6ENtJfy960lQHtUfg38P81E2GAxHPLuc1CAkiMH7KyM+W7myC
	 pGTWZY7yOssUzlrqaynQXdGO83xXobJ6NoGdzOx2pZk7gglVFSfH0nyWXTCtwJzZMVbSN
	 Qv5UH88ItURn4wv5TtVI1uv1Bic2OIUtX9gxrs3C1BHLN+Di6bSQMmfHM7y0Lno00gF3/
	 JF9T+hYVm/o8gjvM0JFpiBlhDa0tlZUaZvVgTOUSp1D4Jr5FKOvSKPI8CDi4LD6R7CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792492779;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=GLseBl3UgSE53/FkTh3ilzjA7595KC2tuSYuxF3+I34=;
	b=CYLRSRYC7wbvpOXPzJ61R5q5axj2U8Hm0fD5VhX4zWZb+7CKrY4kBak26zRKiaiAOWz2
	 s+mJIOqqivl4U/kTuL0azj9G4/oTjDNRKSE0TL3C115+kHyBBJtq4c9C9JZocC0ZoFAYC
	 VuwqWsxbT11YvMnPNEiKR0QuCbnEQwcw5jMTL5on21Wi9M+hXRMV43nCNPkvmzvi9ki5m
	 e6cWyOx/skiFmllLfJ1aHCu4nFlXQL+9kxMp8/2r5Mks11+biLDYc6GN4enn3qtmfwR4P
	 iwTMmTdpLF0wXf9el6CIYUes9hapKdRdL9oooPhxuVO5z2Od0HgV85A+H6U0B9kdVwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OuHE9xWa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9371606A319
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 10:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OuHE9xWa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A4EB1F000C6;
	Tue, 20 Oct 2026 10:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792492778;
	bh=GLseBl3UgSE53/FkTh3ilzjA7595KC2tuSYuxF3+I34=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=OuHE9xWaWRRLIBnpa6TBJ2mPboHABa7mz7ozMqbJrn0RVauhjOPfuRN01stzJVs/A
	 RMF9rUuUSn/lpnAJpio4hweG8nR2oyMnJsKnvxfENfILUCBwRVwQlVojDRsTiBWvax
	 QkleE03XZ6WjmbMxw5g+Xg7ttAZmk5aXh7VK79XZwUkTDdWYnfebUqCPvDhOutDB/k
	 QsmmxGLEOed8oT1fSR175hV5Mxtdi+b+zO3oOjNxXR6LO/O75MmYAI45rkgbpI+cRk
	 rOq5gUduzYCOSoKtqYLdJxzhYSNSPapqYTyVPXdcFeCQXzoleunI5/mxkBDTyqjI+T
	 868yswGXfFeOw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker
 <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, Thomas Gleixner
 <tglx@linutronix.de>, Anna-Maria Behnsen <anna-maria@linutronix.de>, John
 Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [GIT PULL] Rust timekeeping for v7.4-rc1
In-Reply-To: <CANiq72mdZ7H68ijH4SL3nzs8Ztw-+NGkVFt_b2Ab02Vu57nkVg@mail.gmail.com>
References: <87ece1eirv.fsf@kernel.org>
 <CANiq72mdZ7H68ijH4SL3nzs8Ztw-+NGkVFt_b2Ab02Vu57nkVg@mail.gmail.com>
Date: Tue, 20 Oct 2026 12:39:23 +0200
Message-ID: <87fqy0zmec.fsf@t14s.mail-host-address-is-not-set>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> writes:

> On Wed, Oct 7, 2026 at 3:40=E2=80=AFPM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>>
>> Hi Miguel,
>>
>> Please pull these changes for rust timekeeping for v7.4-rc1.
>>
>> The following changes since commit df2908090cda368b01ff43709f51890076c56=
157:
>>
>>   Linux 7.3-rc2 (2026-09-06 15:07:20 -0700)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/rust-for-linux/linux.git tags/rust-timekeeping-for-=
v7.4-rc1
>>
>> for you to fetch changes up to 2ea0119f72dba597aa8a98cbdb72c564bfc5cb38:
>>
>>   rust: hrtimer: document handle based design rationale (2026-09-29 09:2=
2:30 +0200)
>
> Merged into `rust-next` -- thanks!
>
> A couple notes:
>
>   - I had to fetch your updated GPG key. In case it helps: Linus and
> other maintainers may expect to be told about the change when it
> happens (and, in general, rotating them too often may not be
> appreciated).

I think I have a two year rotation cycle set up. I rotated a while back
and did not do any PRs yet, so it slipped my mind. I'll try to remember
in two years.

>
>   - Please try to have a main verb per bullet point in the merge
> commit since that is the style that Linus prefers. Similarly, please
> use ' instead of ` (only for these messages) and wrap the message like
> a commit one. I tweaked the message a bit to match.

Ok, will do.

> By the way, I wonder if we want to add `#` to the "Implementation
> details" sections even if it is a `//` (like we do for the actual
> `///` ones).

I guess we could do that for readability.

Best regards,
Andreas Hindborg



