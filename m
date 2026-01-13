Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2043318B9E;
	Tue, 13 Jan 2026 20:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768337871; cv=none; b=cxl7YrpIFmqpGw0na7swIF9T2t18doNyBTlh2CQPeb/wFAEXxJp2GWoORLvfDMyR6rQde7cX38x306Ugwuf4BU3armXE4UTlFxEQoxN6jz6FhKk3fByhE1EDON3Tls89rWZkI4HTs5GLb4LKF8kj0bfxUmGjPf77gIjEhaMber4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768337871; c=relaxed/simple;
	bh=DeM3U1GFUfao2kW+nxg2Nh1zg/+GLbCZBgdAguleAQ0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EZ7k1PaWd8zrWEh09xSxFeG3SoP6ETaKA13cCwRCxk4yyaRRHZxwz+lr/LtoT9QxxtZsW+1/ooMOwROJw8OmBB6RZ+quEzXwHGZNWMaeT0kRVKkwelMtvveLBtaGptwjepymvOYhui6vkSwRIhapOz5muijorHj5p0H/ajprwW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf09.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id 7AEFC13A0AB;
	Tue, 13 Jan 2026 20:57:43 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf09.hostedemail.com (Postfix) with ESMTPA id 9B5602002A;
	Tue, 13 Jan 2026 20:57:41 +0000 (UTC)
Message-ID: <bfb5bee02f2e69ce1eb8c526dd4cfb82de326226.camel@perches.com>
Subject: Re: [PATCH] checkpatch: warn on Rust comments with rustdoc links
 above items
From: Joe Perches <joe@perches.com>
To: Ryan Foster <foster.ryan.r@gmail.com>, linux-kernel@vger.kernel.org
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org
Date: Tue, 13 Jan 2026 12:57:40 -0800
In-Reply-To: <20260113202138.565332-1-foster.ryan.r@gmail.com>
References: <20260113202138.565332-1-foster.ryan.r@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Stat-Signature: 7rp4179f6ce498ennzfxyw7pgn6qhhrb
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: 9B5602002A
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/TSc5AAYWnYtc0FvFTQtzgdKt07NYj/o4=
X-HE-Tag: 1768337861-800545
X-HE-Meta: U2FsdGVkX1/7as/l2In4YocDIUeKdRs8fXOVnkG5z2eGkQdC7bPRA7xs5ZzaXNHydrSMakkzCDdN3676ya9xBpq1/OOod2KL4fZyIbtNHW1V3uPoeK6HI6FZlbDNa77c4HMroMv65NKAGh70w+LPZLFrfoCQ14WCMcayd3uxkL+FGxHSrs5RPZruQcynKZU03ToofCDsIskOrwm+dKf6YAd0iHk4B+ruvh7CQRw9miBx3q9PCAvttaHKJahumkOzFOk13bwsv9dqwXJUb5AsvmtK0XEdQk9F+IGF4Ns8M6x/6U9mBtxufPiKvlRvQaCP

On Tue, 2026-01-13 at 12:21 -0800, Ryan Foster wrote:
> Add a check to emit a warning when a `//` comment containing rustdoc
> link patterns (like [`Foo`]) appears directly above a Rust item
> declaration. This likely indicates the comment should use `///`
> documentation syntax instead.
[]
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> @@ -3922,6 +3922,26 @@ sub process {
>  			     "Avoid using '.L' prefixed local symbol names for denoting a ran=
ge of code via 'SYM_*_START/END' annotations; see Documentation/core-api/as=
m-annotations.rst\n" . $herecurr);
>  		}
> =20
> +# check for Rust comments that should likely be doc comments
> +# Warn when a // comment that looks like documentation (contains rustdoc
> +# link patterns like [`Foo`]) appears directly above a Rust item.
> +		if ($realfile =3D~ /\.rs$/ &&
> +		    $rawline =3D~ /^\+(\s*)\/\/\s+(.*)$/) {

No objection but maybe $rawline should be something like:

		    $rawline =3D~ m{^\+\s*//(?![/!])(.*)} {
			my $comment_text =3D $1;

etc...

> +			my $comment_text =3D $2;
> +			# Check if this looks like a doc comment (contains rustdoc link patte=
rns)
> +			# and is NOT a special comment like SAFETY:, TODO:, FIXME:, etc.
> +			if ($comment_text =3D~ /\[`[^\]]+`\]/ &&
> +			    $comment_text !~ /^\s*(?:SAFETY|TODO|FIXME|NOTE|XXX|HACK|BUG|INVA=
RIANT):/) {
[]
> +				# Check if next line starts a Rust item
> +				my $nextline =3D $rawlines[$linenr];
> +				if (defined($nextline) &&
> +				    $nextline =3D~ /^\+\s*(?:pub(?:\s*\([^)]*\))?\s+)?(?:unsafe\s+)?=
(?:async\s+)?(?:fn|struct|enum|impl|trait|const|static|type|mod|use)\b/) {
> +					WARN("RUST_COMMENT_NOT_DOC",
> +					     "Comment with rustdoc link pattern may need '///' instead of '=
//'\n" . $herecurr);

[]

Random grep results:

Note: seems to be used as well
What about NB: and INVARIANTS ?

$ git grep -i -P -oh '^\s*\/\/(?![/!])\s*(?:SAFETY|TODO|FIXME|NOTE|XXX|HACK=
|BUG|INVARIANT|\w+):' -- '*.rs'| sed -r 's/^\s+//' | sort | uniq -c | sort =
-rn
   2081 // SAFETY:
    183 // INVARIANT:
     42 // TODO:
     33 // CAST:
     11 // GUARANTEES:
      9 // NOTE:
      8 // PANIC:
      7 // Note:
      6 // TIMEOUT:
      6 // https:
      3 //         Type:
      3 //         TraitItem:
      3 //         Pat:
      3 // OVERFLOW:
      3 //         Item:
      3 //         ImplItem:
      3 // GUARANTEE:
      3 //         ForeignItem:
      3 // FIXME:
      3 //         Expr:
      3 //     Example:
      2 // NB:
      2 // core:
      2 // Author:
      1 // u64:
      1 //     sym:
      1 // std:
      1 //     span:
      1 // sizeof:
      1 // Reference:
      1 // out:
      1 //   Object:
      1 //   namely:
      1 // INVARIANTS:
      1 // in:
      1 // FieldMutability:
      1 // Chip:
      1 // BOUNDS:
      1 //     2:
      1 //     1:
