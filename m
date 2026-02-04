Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B442652A2;
	Wed,  4 Feb 2026 19:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770232114; cv=none; b=nyPLL7DiNAbC3iyxt2gaLUtE+kgHViKVwD8EIbyuFz7hp689DKpoN1j8ldKFPVdkGtpq0RhKGS+DVVMCXBqqmPoBlWwnDKe6hHLH9CdoMKL2/Yk78bJOmVh5R4xEorrH3U0nw6tnxWZBqpjDJYpayZicrkm38z9rvYMAjeoOY0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770232114; c=relaxed/simple;
	bh=WBt345mg2cTlzF+FKAkjpVgOE0wd4ZZ8l5lbQ2bcL74=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dAXItbjBN8KS53SMNe0lz0/kfgb10TT0tUFMbPcipODNLOMmmnrY2J9QUnKBPd8Psu1BEhyom/vdqbDjHWXRF5M2A9ENOz6JM0rNmM3vvyX04Wmc7JXorBfMkM0IPKreZhRYcawsSY9PUHTDMtSSh+P0HeWCEKYqjlH7bUfTe8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf07.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id 5BD9A1B131D;
	Wed,  4 Feb 2026 19:08:26 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf07.hostedemail.com (Postfix) with ESMTPA id B7B7520030;
	Wed,  4 Feb 2026 19:08:23 +0000 (UTC)
Message-ID: <a798e6a368639f7a1ce633a6dfecd088d6ed4123.camel@perches.com>
Subject: Re: [PATCH v4] scripts: checkpatch: warn on Rust panicking methods
From: Joe Perches <joe@perches.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Dirk Behme
	 <dirk.behme@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, Onur =?ISO-8859-1?Q?=D6zkan?=
	 <work@onurozkan.dev>, Jkhall81 <jason.kei.hall@gmail.com>, 
	dirk.behme@de.bosch.com, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 04 Feb 2026 11:08:22 -0800
In-Reply-To: <CANiq72=J5LBxfawu3MtQpcukaXcw+pRyMWd9ueDE=od4X99R3w@mail.gmail.com>
References: <288d4aeb-af0d-4d50-bb0d-7a046abaaf10@de.bosch.com>
		 <20260203152542.45017-1-jason.kei.hall@gmail.com>
		 <20260203184933.23c92f8f@nimda> <DG5GBHGZV86X.2XKAU6WLWCL7Z@garyguo.net>
		 <20260203193240.68bb136e@nimda> <DG5HFQ1JHRA1.QTLZFE4GDZT8@garyguo.net>
		 <c150ba95-a60b-404d-823a-316710035dfd@gmail.com>
		 <CANiq72=J5LBxfawu3MtQpcukaXcw+pRyMWd9ueDE=od4X99R3w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Stat-Signature: tztyr9qt3z443xzhzg1rmot6r73rbem5
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: B7B7520030
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+NL9Rca/XqBqPr3wv1lzV+So7qTeS5JNQ=
X-HE-Tag: 1770232103-495341
X-HE-Meta: U2FsdGVkX19tgG0dSqlT4mh0MjxuRlTNiaBC6esZTjuFiskbHWkIotZtxxsc8Cc4bM4YE6ljKLAy4BaKAqUX6mTOI1B37KCA0W+TX5sTX+ra1XP08oGfEFhgat0HQbTxBOdNXfiwzTrvc4mi0FdB93PnlpNTIn68rwByC8ghUmrMUvVTQj1q8HT7sirfluyZwy1MgUzardBNbvlzjNR2vM3yTNQUN6qSUtQ9le/gtq9gereJkclYVJntQZ80t+DWwX4Gxt62PYGnuITqalBK6XXNrkANjKpu0hPwPMpRWBTPBX1Vae8a+e6A5lWp/oBToqbvZ5fgy+Y2CCkRVYgpTpbgiAJHePB5IxXNsiqpCid1YUQJb99ZWA==

On Wed, 2026-02-04 at 19:10 +0100, Miguel Ojeda wrote:
> On Wed, Feb 4, 2026 at 4:56=E2=80=AFPM Dirk Behme <dirk.behme@gmail.com> =
wrote:
> >=20
> > The question is if we could find a way to make it *consistent*?
> >=20
> > I mean how should a developer know if the warning (he gets once, or
> > even if he checks an existing file with -f always) is relevant or not?
> > We introduce the warning because we want to discourage the use of
> > `unwrap()`. At the same time there are places where its usage is
> > allowed or even needed. How to know what is valid? The warning or the
> > usage?
>=20
> I think usually developers use `checkpatch.pl` mostly on patches, not
> existing files; plus it doesn't make the build fail. Thus I see
> `checkpatch.pl` as a tool that can have way more false positives than
> a linter that we need to keep strictly clean.
>=20
> The idea with the `checkpatch.pl` warning was to have something we
> could land easily before we got the new Clippy lints, and perhaps to
> apply it in more cases than the eventual Clippy lint (since false
> positives are not as concerning).
>=20
> I have some context in
> https://github.com/rust-lang/rust-clippy/issues/15895 -> "Additional
> context", and a few other issues linked in
> https://github.com/Rust-for-Linux/linux/issues/349 for the new lints.

Maybe adding something like this to checkpatch so rust
specific checks and possibly other execs could be added
relatively easily in checkpatch's process()=20

	process_rust() if ($realfile =3D~ /\.rs$/);

---
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index e56374662ff79..bd9daa77470a5 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -20,6 +20,8 @@ my $D =3D dirname(abs_path($P));
=20
 my $V =3D '0.32';
=20
+require "$D/rust_checkpatch.pl";
+
 use Getopt::Long qw(:config no_auto_abbrev);
=20
 my $quiet =3D 0;


