Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDEF42E43F
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Aug 2026 16:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787330570; cv=none; b=GYjA2Wm1mB8Ael97krX/3N2PS9pZau9qAb9B48f2j5fkzkNhQVuN/6JdwENQIoyd0l6H/IJiDNjvsK3es2bIAUwvpxuT2yj4zmJFRk4Wa5hRGqARJ6Ijbt7T4OlKI7n3McU5Lqofz+IXxCCzBkgFXs3L7fijJpIT01IsodWVBDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787330570; c=relaxed/simple;
	bh=m1czO2YB4t/SDWjO/C1S4Edo0WdLGwx3m/cuF6R7Dkk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CImG/zuqRYTsV/ZV0REZUMKj67d5McQre8zHOYayEm0ALxsCIxqezL495UnQRgRNzoNgbqZW3y/l0eqEMpX5gx+yy7wNo8b2mgZ8LjoyLj1iz42FsGWAVQAciFHW0+gwWnNQtRQoK7kDhUpL3LNaZSDKjTksMbQizLUDkwKCOgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=LVclSAUY; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="LVclSAUY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1787330555; x=1787589755;
	bh=m1czO2YB4t/SDWjO/C1S4Edo0WdLGwx3m/cuF6R7Dkk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=LVclSAUYOc29g9l5UGTnL9uuezJStxe1RWDuEFjVRYW2I+oavtOv/yaJPFfEdBn6F
	 3HtsTEZY1mnyEfVXMAMlY61opI3uGqxoYdHqjzb/6h+SLDY9VmyQxcomZQeD1+FOVu
	 bEwZEelpauT8I6n/R7AwVOnccL7YJIwBF9hJHvpFXD16abLEJQCaKeVAsW7v8OQWw4
	 66sMoOQrlcyuuxDVoiCy07PkuB6GAzIS4e4yIdeHqlru+g1cB/6iMbBwgWa662x5+U
	 9lwfZCc4nFZtSaReJdqC5BvKZW5o6oOCZiJ9AKR9W0NXMieuFQWHa0AG70SkK6V7DD
	 UArgOQRTcKzzg==
X-Pm-Submission-Id: 4hRR1P299Gz1DDLk
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	dakr@kernel.org,
	aliceryhl@google.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu
Subject: Re: [PATCH v6 2/3] drm/tyr: add GPU reset infrastructure
Date: Fri, 21 Aug 2026 19:42:30 +0300
Message-ID: <20260821164232.1118419-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <2AD43D0D-2B01-47E3-AACB-32032B3358C9@collabora.com>
References: <20260819-tyr-reset-impl-v6-0-7b4e1e041fe5@onurozkan.dev> <20260819-tyr-reset-impl-v6-2-7b4e1e041fe5@onurozkan.dev> <653D47F5-0AF3-44B5-9896-F0AA81F67B61@collabora.com> <20260821155814.980146-1-work@onurozkan.dev> <2AD43D0D-2B01-47E3-AACB-32032B3358C9@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 21 Aug 2026 13:39:45 -0300=0D
Daniel Almeida <daniel.almeida@collabora.com> wrote:=0D
=0D
> =0D
> =0D
> > On 21 Aug 2026, at 12:58, Onur =C3=96zkan <work@onurozkan.dev> wrote:=0D
> > =0D
> > On Fri, 21 Aug 2026 12:31:03 -0300=0D
> > Daniel Almeida <daniel.almeida@collabora.com> wrote:=0D
> > =0D
> >> Hi Onur,=0D
> >> =0D
> >>> On 19 Aug 2026, at 15:45, Onur =C3=96zkan <work@onurozkan.dev> wrote:=
=0D
> >>> =0D
> >>> Add support for scheduling GPU resets on a dedicated workqueue. Track=
=0D
> >>> the reset state to avoid queueing another reset while one is already=
=0D
> >>> pending or in progress.=0D
> >>> =0D
> >>> Use an SRCU based gate with mutex-protected reader admission to block=
=0D
> >>> hardware accesses while reset work runs and wait for current users=0D
> >>> before resetting.=0D
> >>> =0D
> >>> Stop new reset requests during teardown and drain any queued or runni=
ng=0D
> >>> reset work before releasing the device resources.=0D
> >>> =0D
> >>> This is the initial reset infrastructure only. It is not wired to a r=
eset=0D
> >>> source yet as those will follow in separate work.=0D
> >>> =0D
> >>> Link: https://gitlab.freedesktop.org/panfrost/linux/-/work_items/28=0D
> >>> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>=0D
> >> =0D
> >> I=E2=80=99d use dev_info instead, I don=E2=80=99t think a reset belong=
s in dev_dbg.=0D
> > =0D
> > It was dev_dbg initially, Danillo said otherwise and I changed it. I ha=
ve no=0D
> > strong feeling on both.=0D
> > =0D
> =0D
> You mean it was dev_info initially?=0D
=0D
Yeah, I wrote it incorrectly.=0D
=0D
> =0D
> > Does it deserve a new version to switch back into dev_dbg again? I thin=
k we can=0D
> > easily switch that when pulling this series.=0D
> =0D
> My point is that resetting the GPU should not be a =E2=80=9Cdebug=E2=80=
=9D trace, but rather something=0D
> that should hit dmesg unconditionally. Of all things that are printed on =
a driver, a =0D
> =E2=80=9Chey the GPU is being reset because something crashed=E2=80=9D is=
 something that should=0D
> always show up IMHO.=0D
> =0D
> I don=E2=80=99t think you need to send a new version though, let=E2=80=99=
s wait for more feedback=0D
> as well.=0D
> =0D
=0D
Okay.=0D
=0D
- Onur=0D
=0D
> =0D
> =E2=80=94 Daniel=0D
> =0D
