Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAE2243364
	for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 12:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747657569; cv=none; b=CtXFTzo+q+nLEK7udi9NSAmcEayojeHkcCGDZwTodIhFVrgCkhi9xq/nLK3R/dAikQnP4t3uIScWVctGtVuE8w0qUlpQ+bbbNmlLitRkAh4Sam2Ve+pw+8rIpRqyOqIQHfNOxfa4OeyaF5peq101xiZBfc5rYP9xRMcGkzNrdws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747657569; c=relaxed/simple;
	bh=IDm1lnmH8i5Jc0QN2R5yydX3w8LDzL7R8VSGykatnf8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=KbpsikW0H1c8qmzFQaaUzcCfHyKGLS8FbhbfyYXiSx54uHrA1xWfs1T7l4+7T0kATaL26HEIZOyrmB+A1VyYMT/QSq7etezJX3II4sqxBbu+MfTBUMJy1cdAyfjm7uwM85n+49i3yuy+ccHADCQv3x54c8EadBpf0RGQtQFg2OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kkh2beBp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kkh2beBp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9960C4CEE4;
	Mon, 19 May 2025 12:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747657568;
	bh=IDm1lnmH8i5Jc0QN2R5yydX3w8LDzL7R8VSGykatnf8=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=Kkh2beBpeRsbGlCBVl8e0CULPkNejvQJ4zJKUYGzUejxFwtsFkLHFkidcguhV/2TP
	 ZLP1qFSw7xP9TheeusRNFJpeVDpYPaab0+0k6fQqxV9R6Itm2+buupGUTzjm0AVRfo
	 PRTw5b3EtnkQH1+BCGit9iwe0WK79FUMQmjOAuaeDZaG0H3h2zGVU/xsgNweeQ73v/
	 n6hHpK3sGEmELblGyxn8uU3mSFK2Z0b7DlETQjZSnVoQL3AlrdxZcTOqxHh9cIZwbw
	 Wft67JZugUPPSGhIcfrJAzrgvgqC1jtK16SWicBcYnjeL+O03YLw3l5tLGuTHWeB6+
	 B07l/91pwH77g==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 May 2025 14:26:05 +0200
Message-Id: <DA04WHRZBBS0.17WRMWDF0A335@kernel.org>
Cc: "Marcelo Moreira" <marcelomoreira1905@gmail.com>,
 <benno.lossin@proton.me>, <ojeda@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 <~lkcamp/patches@lists.sr.ht>
Subject: Re: [PATCH v2] rust: doc: Clarify safety invariants for Revocable
 type
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250503145307.68063-1-marcelomoreira1905@gmail.com>
 <D9RJQYNTIOK1.3HI7NDDWPK6IM@kernel.org> <aChczAWsPdmdeen3@pollux>
 <D9YO7XDNV712.3A5HSSLUQIZ2W@kernel.org> <aCrwuQP46RFHxYB5@pollux>
 <DA00X0RTYKMA.2OG25TZ1X3AU@kernel.org> <aCsAEJtkCKKhspnF@pollux>
 <DA03ANJMDOU2.1ZQWA6MIENVKD@kernel.org> <aCsX-k0K_jqLvD4e@pollux>
In-Reply-To: <aCsX-k0K_jqLvD4e@pollux>

On Mon May 19, 2025 at 1:37 PM CEST, Danilo Krummrich wrote:
> On Mon, May 19, 2025 at 01:10:32PM +0200, Benno Lossin wrote:
>> On Mon May 19, 2025 at 11:55 AM CEST, Danilo Krummrich wrote:
>> > On Mon, May 19, 2025 at 11:18:42AM +0200, Benno Lossin wrote:
>> > Why not? Please show me a case where `is_available` is false, but I ca=
n still
>> > technically access data (without violating a safety requirement).
>>=20
>>     let r: Arc<Revocable<i32>> =3D ...;
>>     let guard =3D r.try_access().unwrap(); // nobody else is holding a r=
eference, so this can't fail
>>=20
>>     let r2 =3D r.clone();
>>=20
>>     // I know we don't have threads, but I don't want to have to look up
>>     // how to use the workqueue or something else...
>>     thread::spawn(move || {
>>         r2.revoke();
>>     });
>>=20
>>     for _ in 0..10_000_000 {
>>         // do some non-sleeping work that takes a while
>>     }
>>=20
>>     // now the thread above has executed `self.is_available.swap(false, =
Ordering::Relaxed)`
>>     // in `revoke_internal` and is waiting for the `synchronize_rcu` cal=
l to return.
>>     // but we can still access `guard`:
>>=20
>>     pr_info!("{}", &*guard);
>
> Which is perfectly correct, you're right. I think I was too focused on th=
e
> optimization case. :-)

And I was assuming the example was obvious with just saying "But the
`is_available` atomic *can* be altered during the usage of `data`." :-)

>> > However, this invariant does not need to be fulfilled for access() and
>>=20
>> Where is `access()` defined?
>
> https://gitlab.freedesktop.org/drm/nova/-/commit/46f91addfabbd4109fb64876=
a032ae4a4a924919

"Reviewed-by: Benno Lossin <benno.lossin@proton.me>" huh, I already
forgot about the patch... But that also shouldn't be difficult to
support with the right invariant.

>> > revoke_nosync(), because it would circumvent their purpose, i.e. cases=
 where an
>> > abstraction can prove that there can't be a concurrent user of the dat=
a or a
>> > concurrent user revoking the data respectively.
>>=20
>> Yes. How about something like "`data` is valid while `is_available` is
>> true. It also is valid if the RCU read-side lock is being held and it
>> was taken while `is_available` was true."?
>>=20
>> That should also cover the "nobody else is accessing this" case.
>
> Sounds good to me!

I'm not happy with the sentence structure, so how about:

* `data` is valid for reads in two cases:
    * while `is_available` is true, or
    * while the RCU read-side lock is taken and it was acquired while `is_a=
vailable` was `true`.
* `data` is valid for writes when `is_available` was atomically changed fro=
m `true` to `false`.

The last one is needed in order to call `drop_in_place`.

---
Cheers,
Benno
