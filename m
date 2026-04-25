Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85543175A9D;
	Sat, 25 Apr 2026 15:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777129964; cv=none; b=N3KNQNvq3GCj8S15JdzNzpz4WjLln+FdCGOt/htaYKaiRdkFbFEJuIGF05/lTwbS0LGaD/tz/ocG7tkvNon5JSSdrREUeivWfNEOuYA5oCRjZijtrax2vQ4je1itCprJV56WZfhkNlq2cddF1p0R9ekR2TmVYM6t6fzca9D7bWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777129964; c=relaxed/simple;
	bh=vDTvAmbQ2mVXPunZVqXDMLyGrTyrFs9fTaWH92/GLF4=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=VBpTzTn7dY1QoyG+YBADG2JvbKIYAs8weU3Sclusld5fWcifmfYvJmFTKxJ0S/a0XK2/wChI/WQw3zLEQ+KhPnKzSa7AzycmD0cEoip2MNkHWJYX2xj915JB7HV3ktzyCayOJd/PDsT0GaaXx0NXfOfBQJro77Kc9fGIKocDkjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gz10mEGb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gz10mEGb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBF49C2BCB0;
	Sat, 25 Apr 2026 15:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777129964;
	bh=vDTvAmbQ2mVXPunZVqXDMLyGrTyrFs9fTaWH92/GLF4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=Gz10mEGb8LdtvPHiAhavSc7ezhucdSXYGAx9Je160PX4Y6E4jKEH92SpzqhJCmu81
	 1rHxgZ6XZIVkSjwtA5LdwE6bWOVsus2wJpk0zN9agazXTHmSwsonnsjllqYfoPN+GJ
	 vxngOiegQsTjUovoQI/w96CN7UnN+5MDLx+Cta+Pct/K2HF4dnvYCB1b5pnJjfs8/w
	 IoJBfQ3Hu7bwCqNoEgNC74NyRcLbT5FxE+WCJNtRqWNfsCreNfLOziid6m1SvL01oJ
	 PgfdbqyIwNp8lfDpT3oTb8Nq0fku+mWqPofiN1tVcGriSqQEwzW0LdGGpAcxAN50PG
	 ALktRJXLjs0RQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 1/2] scripts: generate_rust_analyzer.py: add
 versioning infrastructure
From: Tamir Duberstein <tamird@kernel.org>
To: Jesung Yang <y.j3ms.n@gmail.com>
Cc: Tamir Duberstein <tamird@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <CA+tqQ4JcmO_E0xHJPX3HxgDiqv+KQk4q-xBvYk7DSEkifWhtWg@mail.gmail.com>
References: <20260317-ra-fix-primitive-v4-0-bc06709c8243@gmail.com>
 <20260317-ra-fix-primitive-v4-1-bc06709c8243@gmail.com>
 <177393252080.237.233380198774445367.b4-review@b4>
 <CA+tqQ4JcmO_E0xHJPX3HxgDiqv+KQk4q-xBvYk7DSEkifWhtWg@mail.gmail.com>
Date: Sat, 25 Apr 2026 11:12:38 -0400
Message-Id: <177712995819.98244.11409833540971152770.b4-reply@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3356; i=tamird@kernel.org;
 h=from:subject:message-id; bh=vDTvAmbQ2mVXPunZVqXDMLyGrTyrFs9fTaWH92/GLF4=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlvbj6XmhchME3238qqtaG7Sr0zjj14wrDv6Qm+5kjtW
 UZRWfE3OiayMIhxMViKKbIkih7am556e49s5rvjMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOgY4xAxenAEx1HA8jw/p150/83usvJixuKxbo35G5byLnBs81aufddYOddu8NLGRk+MZ+xZO
 poFq0jWW+q8GtdXcWHPgy6fe9shPGF0yuv2owYQMA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

On 2026-04-25 12:15:03+00:00, Jesung Yang wrote:
> On Thu, Mar 19, 2026 at 3:02 PM Tamir Duberstein <tamird@kernel.org> wrote:
> 
> > On Tue, 17 Mar 2026 18:29:54 +0900, Jesung Yang <y.j3ms.n@gmail.com> wrote:
> >
> > Could we move this type down so it's closer to its site of use? It's ~350 linues down.
> 
> Sure, will do.
> 
> > > @@ -200,67 +227,70 @@ def generate_crates(
> >
> > It would be great to avoid having to sprinkle this everywhere, though I admit
> > it's not immediately obvious to me how to achieve it. Maybe we can live with it
> > until the MSRV bump. Again, would be great to structure this in a way that
> > makes that cleanup simple when the time comes.
> 
> I considered using function decorators, but on second thought, that
> would just be another way of sprinkling functions around.

Can you explain how function decorators would help? Not entirely clear
to me.

> 
> In my view, the cleanup should still be fairly straightforward even with
> the current `sysroot_deps` approach. We could just remove the function
> and let mypy (or an LSP) flag the undefined function error/warnings.
> Does that sound reasonable to you?

Mechanically that would work of course, but it would result in a
flip-flop in the git history. I was hoping to avoid changes at the
caller for this reason.

> 
> > > @@ -335,12 +370,120 @@ def generate_crates(
> >
> > There should be a note here explaining that this should be bumped when MSRV is
> > bumped, and how to obtain the new values that should go here. It's really
> > important that the string MSRV appears as it's a likely grep target for when
> > that pointer is updated.
> 
> I'll add a comment about the MSRV bump. Unfortunately, there isn't a
> reliable way to programmatically retrieve the matching rust-analyzer
> release AFAICT. I typically follow these steps:
> 
> 1. Look for the commit history of `src/tools/rust-analyzer` in the
>    upstream Rust repository (either locally or via GitHub [1]).
> 2. Check the latest merge commit from on the rust-analyzer side, which
>    usually starts with "Merge pull request #<PR_ID>".
> 3. Search for that <PR_ID> on the rust-analyzer release page [2].
> 4. Grab the version string and release date.
> 
> Perhaps the better approach is to perform these manual checks upfront
> for versions 1.86 through 1.94, at which point this version
> infrastructure can finally be removed.
> 
> [1] https://github.com/rust-lang/rust/commits/<TAG>/src/tools/rust-analyzer
> [2] https://github.com/rust-lang/rust-analyzer/releases

I defer to you on whether or not to do this up front, but I'd like us to
document the procedure either way. If possible, prefer to describe it in
terms of the git CLI rather than GitHub.

> 
> > > [ ... skip 40 lines ... ]
> >
> > The call to generate_crates should probably be below the block that synthesizes RaVersionInfo.
> 
> Sorry, could you elaborate on this? Not sure what you meant by
> "synthesizes RaVersionInfo".

Sorry, it's been a while and now I'm not sure. I likely meant the block
in which the calls to `query_ra_version` and `map_ra_version_baseline`
appear.

> 
> > > [ ... skip 24 lines ... ]
> >
> > either "a different version string" or "different version strings"
> 
> Nice catch, thanks.
> 
> Best regards,
> Jesung


